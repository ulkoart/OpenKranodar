//
//  StructuralUnitsInteractor.swift
//  OpenKranodar
//
//  Created by user on 13.09.2021.
//

import Foundation

protocol StructuralUnitsInteractorProtocol {
    var presenter: StructuralUnitsPresenterProtocol? { get set }
    
    func retrieveStructuralUnits() -> Void
}

final class StructuralUnitsInteractor: StructuralUnitsInteractorProtocol {
    weak var presenter: StructuralUnitsPresenterProtocol?
    private var subdivisionsService: SubdivisionServiceProtocol = SubdivisionService.shared
    private var subdivisions: [Subdivision]?
    
    func retrieveStructuralUnits() {
        subdivisionsService.getSubdivision { [weak self] subdivisions in
            /// убрать дубликаты
            let uniqueSubdivisions = Array(Set(subdivisions)).sorted { $0.id < $1.id }
            self?.presenter?.fetchStructuralUnitsSuccess(subdivisions: uniqueSubdivisions)
        } failure: { [weak self] error in
            self?.presenter?.fetchStructuralUnitsFailure(error: error)
        }
    }
}
