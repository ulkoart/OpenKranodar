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
}

class StructuralUnitsPresenter: StructuralUnitsPresenterProtocol {
    weak var viewController: StructuralUnitsViewControllerProtocol?
    var interactor: StructuralUnitsInteractorProtocol?
    var router: StructuralUnitsRouterProtocol?
    
    func fetchStructuralUnits(){
        viewController?.showLoadingView()
        interactor?.retrieveStructuralUnits()
    }
    
    func fetchStructuralUnitsSuccess(subdivisions: [Subdivision]) {
        viewController?.hideLoadingView()
        viewController?.showStructuralUnits(subdivisions)
    }
    
    /// Ошибка при запросе данных
    func fetchStructuralUnitsFailure(error: String) {
        viewController?.hideLoadingView()
        // TODO показать ошибку
    }
}
