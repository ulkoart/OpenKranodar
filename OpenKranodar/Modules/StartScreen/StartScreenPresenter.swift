//
//  StartScreenPresenter.swift
//  OpenKranodar
//
//  Created by user on 13.09.2021.
//

import UIKit

/// Протокол StartScreen
protocol StartScreenPresenterProtocol: AnyObject {
    /// viewController
    var viewController: StartScreenViewControllerProtocol? { get set }
    var router: StartScreenRouterProtocol? { get set }
    
    func openWebSite() -> Void
    func openCommunicationEditors() -> Void
    func goToApp() -> Void
}

class StartScreenPresenter: StartScreenPresenterProtocol {
    weak var viewController: StartScreenViewControllerProtocol?
    var router: StartScreenRouterProtocol?
    
    func openWebSite() {
        if let url = URL(string: "https://opendata.krd.ru/") {
            UIApplication.shared.open(url)
        }
    }
    
    func openCommunicationEditors() {
        if let url = URL(string: "https://opendata.krd.ru/svyaz-s-redaktsiey-sayta/") {
            UIApplication.shared.open(url)
        }
    }
    
    func goToApp() {
        guard let viewController = viewController else { return }
        router?.presentStructuralUnits(from: viewController)
    }
}
