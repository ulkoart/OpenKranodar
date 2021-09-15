//
//  StructuralUnitsInteractor.swift
//  OpenKranodar
//
//  Created by user on 13.09.2021.
//

import Foundation

protocol StructuralUnitsInteractorProtocol {
    var presenter: StructuralUnitsPresenterProtocol? { get set }
    var subdivisions: [Subdivision]? { get set }
    
    func retrieveStructuralUnits() -> Void
}

class StructuralUnitsInteractor: StructuralUnitsInteractorProtocol {
    weak var presenter: StructuralUnitsPresenterProtocol?
    
    var subdivisions: [Subdivision]?
    
    func retrieveStructuralUnits() {
        // Получили данные
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.subdivisions = [.init(id: 1, title: "Городская Дума"), .init(id: 2, title: "Управление торговли и бытового обслуживания")]
            self?.presenter?.fetchStructuralUnitsSuccess(subdivisions: self?.subdivisions ?? [])
            }
    }
}
