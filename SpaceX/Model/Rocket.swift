//
//  Rocket.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation

public struct Rocket: Codable {
    
    public let rocketId: String
    public let rocketName: String
    public let rocketType: String
    
    public enum CodingKeys: String, CodingKey {
        case rocketId = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
    }
}
