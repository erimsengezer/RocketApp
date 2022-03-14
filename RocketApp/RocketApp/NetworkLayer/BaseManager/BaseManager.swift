//
//  BaseManager.swift
//  RocketApp
//
//  Created by Erim Şengezer on 9.03.2022.
//

import Moya
import Foundation

protocol BaseManagerProtocol {

}

class BaseManager<Target: TargetType, Provider: MoyaProvider<Target>>: BaseManagerProtocol {

    private var rocketProvider: Provider

    init(rocketProvider: Provider) {
        self.rocketProvider = rocketProvider
    }

    func request<T: Decodable>(target: Target, completion: @escaping (Result<T, Error>) -> ()) {
        rocketProvider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
