//
//  Definitions.swift
//  RocketApp
//
//  Created by Erim Şengezer on 8.03.2022.
//

import Foundation

import Moya

// MARK: Provider
func createMoyaProvider<Target: TargetType>(targetType: Target.Type) -> MoyaProvider<Target> {
    let provider = MoyaProvider<Target>()
    provider.session.sessionConfiguration.timeoutIntervalForRequest = 120
    return provider
}

// MARK: RequestParameters
typealias APIRequestParameters = [String: Any]

// MARK: Typealiases
typealias MoyaMethod = Moya.Method
typealias MoyaTask = Task

// MARK: Definitions
let DefaultJSONEncoding = JSONEncoding.default
let DefaultURLEncoding = URLEncoding.default

// MARK: TargetType - Header
public protocol MTargetType: TargetType {}

extension MTargetType {

    var baseURL: URL {
        return URL(string: NetworkUtil.environmentBaseURL)!
    }

    public var headers: [String: String]? {
        let headers: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
        ]
        return headers
    }

    func generateEndPoint(lastPath: String) -> String {
        return NetworkUtil.generateMobileEndPointV1(lastPath: lastPath)
    }
}
