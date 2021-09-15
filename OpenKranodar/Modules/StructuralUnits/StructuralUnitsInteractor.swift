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
        // Получили данные
        subdivisionsService.getSubdivision { subdivision in
            
        } failure: { [weak self] error in
            self?.presenter?.fetchStructuralUnitsFailure(error: error)
        }

        
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
//            self?.subdivisions = [.init(id: 1, title: "Городская Дума"), .init(id: 2, title: "Управление торговли и бытового обслуживания")]
//            self?.presenter?.fetchStructuralUnitsSuccess(subdivisions: self?.subdivisions ?? [])
//            }
    }
}
