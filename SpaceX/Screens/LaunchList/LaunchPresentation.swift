//
//  LaunchPresentation.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation

public struct LaunchPresentation: Equatable {
    let missionName: String
    let launchYear: String
    let rocketName: String
    let smallImageLink: String
    let bigImageLink: String
    let detail: String?
}

extension LaunchPresentation {
    init(launch: Launch) {
        self.init(missionName: launch.missionName, launchYear: launch.launchYear,
                  rocketName: launch.rocket.rocketName, smallImageLink: launch.links.missionImageSmall,
                  bigImageLink: launch.links.missionImage, detail: launch.details)
    }
}
