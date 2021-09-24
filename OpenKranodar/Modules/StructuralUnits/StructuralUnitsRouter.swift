//
//  StructuralUnitsRouter.swift
//  OpenKranodar
//
//  Created by user on 13.09.2021.
//

import UIKit

protocol StructuralUnitsRouterProtocol: AnyObject {
    static func createModule() -> UINavigationController
    func presentDepartmentOfTradeScreen() -> Void
}

class StructuralUnitsRouter: StructuralUnitsRouterProtocol {
    static func createModule() -> UINavigationController {
        let viewController = StructuralUnitsViewController()
        let router = StructuralUnitsRouter()
        let presenter: StructuralUnitsPresenterProtocol = StructuralUnitsPresenter()
        let interactor: StructuralUnitsInteractorProtocol = StructuralUnitsInteractor()
        
        viewController.presenter = presenter
        viewController.presenter?.router = router
        viewController.presenter?.viewController = viewController
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = viewController.presenter
                
        return UINavigationController(rootViewController: viewController)
    }
    
    func presentDepartmentOfTradeScreen() {
        print(#function)
    }
}
