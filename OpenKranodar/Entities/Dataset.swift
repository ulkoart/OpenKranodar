//
//  Dataset.swift
//  OpenKranodar
//
//  Created by user on 13.09.2021.
//

import Foundation

struct Dataset: Codable {
    let id: Int
    let title, name: String
    let subdivision: Subdivision?
}

typealias Datasets = [Dataset]
