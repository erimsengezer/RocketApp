//
//  Rocket.swift
//  RocketApp
//
//  Created by Erim Şengezer on 9.03.2022.
//

import Foundation


// MARK: - RocketElement
typealias Rocket = [RocketElement]

struct RocketElement: Codable {
    let flickr_images: [String]?
    let name: String?
    let wikipedia: String?
    let description: String?
    let id: String?
}
