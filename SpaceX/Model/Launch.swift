//
//  Launch.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation

public struct Launch: Codable {
    
    public let flightNumber: Int
    public let missionName: String
    public let launchYear: String
    public let rocket: Rocket
    public let links: Link
    public let details: String? 
    
    public enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case launchYear = "launch_year"
        case rocket
        case links
        case details
    }
}
