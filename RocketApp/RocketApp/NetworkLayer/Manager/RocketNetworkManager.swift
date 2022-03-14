//
//  RocketNetworkManager.swift
//  RocketApp
//
//  Created by Erim Şengezer on 9.03.2022.
//

import Moya

protocol RocketNetworkManagerProtocol {
    func getAllRockets(completion: @escaping (Result<Rocket, Error>) -> ())
}

class RocketNetworkManager: BaseManager<RocketAPI, MoyaProvider<RocketAPI>>, RocketNetworkManagerProtocol {
    
    override init(rocketProvider: MoyaProvider<RocketAPI>) {
        super.init(rocketProvider: rocketProvider)
    }

    func getAllRockets(completion: @escaping (Result<Rocket, Error>) -> ()) {
        request(target: .getAllRockets, completion: completion)
    }
}
