//
//  StructuralUnitsInteractor.swift
//  OpenKranodar
//
//  Created by user on 13.09.2021.
//

import Foundation

protocol StructuralUnitsInteractorProtocol {
    var presenter: StructuralUnitsPresenterProtocol? { get set }
}

class StructuralUnitsInteractor: StructuralUnitsInteractorProtocol {
    weak var presenter: StructuralUnitsPresenterProtocol?
}
