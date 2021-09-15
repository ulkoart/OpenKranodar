//
//  APIClient.swift
//  OpenKranodar
//
//  Created by user on 15.09.2021.
//

import Foundation

class APIClient {
    typealias SuccessCompletion = ([Subdivision]) -> Void
    typealias FailureCompletion = (String) -> Void
    
    static let shared: APIClient = { APIClient() }()
    private init() {}
    
    func getSubdivisions(success: @escaping SuccessCompletion, failure: @escaping FailureCompletion) {
        guard let url = URL(string: "https://opendata.krd.ru/api/v1/datasets/") else {
            failure("Ошибка формирования URL.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                failure(error?.localizedDescription ?? "Ошибка сети.")
            }
            
            guard let data = data else {
                failure("Ошибка с данными сетевого запроса.")
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let jsonDataset = try jsonDecoder.decode([Dataset].self, from: data)
                let subdivisions = jsonDataset
                    .map { $0.subdivision }
                    .compactMap { $0 }
                success(subdivisions)
            } catch {
                failure(error.localizedDescription)
            }
        }
        task.resume()
    }
}
