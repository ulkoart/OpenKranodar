//
//  APIClient.swift
//  OpenKranodar
//
//  Created by user on 15.09.2021.
//

import Foundation

class APIClient {
    typealias SuccessCompletion = ([Subdivision]) -> Void
    typealias FailureCompletion = (String) -> Void
    
    static let shared: APIClient = { APIClient() }()
    private init() {}
    
    func getSubdivisions(success: @escaping SuccessCompletion, failure: @escaping FailureCompletion) {
        guard let url = URL(string: "") else {
            failure("Ошибка формирования URL.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                failure(error?.localizedDescription ?? "Ошибка сети.")
            }
            
            guard let data = data else {
                failure("Ошибка с данными сетевого запроса.")
                return
            }
        }
        task.resume()
    }
}
