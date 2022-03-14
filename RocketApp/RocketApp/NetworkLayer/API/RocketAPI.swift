//
//  RocketAPI.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//

import Foundation
import Moya

enum RocketAPI {
    case getAllRockets
}

extension RocketAPI: MTargetType {
    
    var path: String {
        switch self {
        case .getAllRockets:
            return generateEndPoint(lastPath: "/rockets")
        }
    }
    
    var method: MoyaMethod {
        switch self {
        case .getAllRockets:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAllRockets:
            return .requestPlain
        }
    }
}
