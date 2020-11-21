//
//  LaunchListCellViewModel.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation

class LaunchListCellViewModel: LaunchListCellViewModelType  {
    
    // MARK: Properties
    
    private var launch: LaunchPresentation
    
    var missionName: String {
        return launch.missionName
    }
    
    var launchYear: String {
        return launch.launchYear
    }
    
    var rocketName: String {
        return launch.rocketName
    }
    
    var imageLink: String {
        return launch.imageLink
    }
    
    // MARK: init
    init(launch: LaunchPresentation) {
        self.launch = launch
    }
}
