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

/*
 {
         "flight_number": 1,
         "mission_name": "FalconSat"
         "launch_year": "2006",
         "rocket": {
             "rocket_id": "falcon1",
             "rocket_name": "Falcon 1",
             "rocket_type": "Merlin A"
         },
         "links": {
             "mission_patch": "https://images2.imgbox.com/40/e3/GypSkayF_o.png",
             "mission_patch_small": "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png",
             "article_link": "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html",
             "wikipedia": "https://en.wikipedia.org/wiki/DemoSat",
             "video_link": "https://www.youtube.com/watch?v=0a_00nJ_Y88",
             "youtube_id": "0a_00nJ_Y88",
         },
         "details": "Engine failure at 33 seconds and loss of vehicle"
     },
 */
