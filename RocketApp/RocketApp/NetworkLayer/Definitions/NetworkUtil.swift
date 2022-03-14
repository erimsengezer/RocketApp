//
//  NetworkUtil.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//

import Foundation

enum APIEnvironment {
    case dev
    case production
}

struct NetworkUtil {
    private static let environment: APIEnvironment = .dev

    static var environmentBaseURL: String {
        switch NetworkUtil.environment {
        case .production: return "https://api.spacexdata.com/"
        case .dev: return "https://api.spacexdata.com/"
        }
    }

    static func generateMobileEndPointV1(lastPath: String) -> String {
        return "v4\(lastPath)"
    }
}
