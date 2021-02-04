//
//  Link.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation

public struct Link: Codable {
    
    public let missionImage: String?
    public let missionImageSmall: String?
    public let articleLink: String?
    public let wikipediaLink: String?
    public let videoLink: String?
    
    public enum CodingKeys: String, CodingKey {
        case missionImage = "mission_patch"
        case missionImageSmall = "mission_patch_small"
        case articleLink = "article_link"
        case wikipediaLink = "wikipedia"
        case videoLink = "video_link"
    }
}
