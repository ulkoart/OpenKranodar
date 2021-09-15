//
//  SubdivisionService.swift
//  OpenKranodar
//
//  Created by user on 15.09.2021.
//

import Foundation

protocol SubdivisionServiceProtocol {
    typealias SuccessCompletion = ([Subdivision]) -> Void
    typealias FailureCompletion = (String) -> Void
    
    func getSubdivision(success: @escaping SuccessCompletion, failure: @escaping FailureCompletion)
}

final class SubdivisionService: SubdivisionServiceProtocol {
    static let shared: SubdivisionServiceProtocol = { SubdivisionService() }()
    private init() {}
    
    func getSubdivision(success: @escaping SuccessCompletion, failure: @escaping FailureCompletion) {
        APIClient.shared.getSubdivisions { subdivisions in
            success(subdivisions)
        } failure: { error in
            failure(error)
        }
    }
}
