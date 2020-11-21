//
//  LaunchListCellViewModelType.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation

protocol LaunchListCellViewModelType {
    var missionName: String { get }
    var launchYear: String { get }
    var rocketName: String { get }
    var imageLink: String { get }
}
