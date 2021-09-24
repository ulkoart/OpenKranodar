//
//  StructuralUnitsPresenter.swift
//  OpenKranodar
//
//  Created by user on 13.09.2021.
//

import UIKit

protocol StructuralUnitsPresenterProtocol: AnyObject {
    var viewController: StructuralUnitsViewControllerProtocol? { get set }
    var interactor: StructuralUnitsInteractorProtocol? { get set }
    var router: StructuralUnitsRouterProtocol? { get set }
    
    func fetchStructuralUnits() -> Void
    func fetchStructuralUnitsSuccess(subdivisions: [Subdivision]) -> Void
    func fetchStructuralUnitsFailure(error: String) -> Void
    func showSubdivisionDetail(_ subdivision :Subdivision)
}

class StructuralUnitsPresenter: StructuralUnitsPresenterProtocol {
    weak var viewController: StructuralUnitsViewControllerProtocol?
    var interactor: StructuralUnitsInteractorProtocol?
    var router: StructuralUnitsRouterProtocol?
    
    private enum SubdivisionSection: Int {
        case departmentOfTrade = 2
    }
    
    func fetchStructuralUnits(){
        viewController?.showLoadingView()
        interactor?.retrieveStructuralUnits()
    }
    
    /// Задать structuralUnit
    func fetchStructuralUnitsSuccess(subdivisions: [Subdivision]) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.hideLoadingView()
            self?.viewController?.showStructuralUnits(subdivisions)
        }
    }
    
    /// Ошибка при запросе данных
    func fetchStructuralUnitsFailure(error: String) {
        viewController?.hideLoadingView()
        // TODO показать ошибку
    }
    
    
    /// Переход на экран раздела
    /// - Parameter subdivision: передается subdivision
    /// в зависимости от id вызывается роутер с переходом на соответствующий экран
    func showSubdivisionDetail(_ subdivision :Subdivision) {
        guard let subdivisionSection = SubdivisionSection(rawValue: subdivision.id) else { return }
        
        switch subdivisionSection {
        case .departmentOfTrade:
            router?.presentDepartmentOfTradeScreen()
        }
    }
}
