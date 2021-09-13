//
//  StartRouter.swift
//  OpenKranodar
//
//  Created by user on 12.09.2021.
//

import UIKit

protocol StartScreenRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func presentStructuralUnits(from view: StartScreenViewControllerProtocol) -> Void
}

class StartScreenRouter: StartScreenRouterProtocol {
    static func createModule() -> UIViewController {
        let viewController = StartScreenViewController()
        let presenter: StartScreenPresenterProtocol = StartScreenPresenter()
        let router: StartScreenRouterProtocol = StartScreenRouter()
        
        presenter.viewController = viewController
        presenter.router = router
        viewController.presenter = presenter
        
        return viewController
    }
    
    func presentStructuralUnits(from view: StartScreenViewControllerProtocol) {
        let structuralUnitsViewController = StructuralUnitsRouter.createModule()
        guard
            let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let window = appDelegate.window
        else { return }
        
        window.rootViewController = structuralUnitsViewController
        window.makeKeyAndVisible()
        let options: UIView.AnimationOptions = [.transitionCrossDissolve]
        UIView.transition(with: window, duration: 0.3, options: options, animations: {}, completion: nil)
    }
}
