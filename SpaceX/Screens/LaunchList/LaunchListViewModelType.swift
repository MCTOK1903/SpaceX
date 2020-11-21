//
//  LaunchListViewModelType.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation

protocol LaunchListViewModelType {
    var delegate: LaunchListViewModelDelegate? { get set }
    func load()
    func selectLaunch(with launchPresantation: LaunchPresentation)
}

enum LaunchListViewModelOutput: Equatable {
    
    static func == (lhs: LaunchListViewModelOutput, rhs: LaunchListViewModelOutput) -> Bool {
        switch (lhs, rhs) {
        case (.updateTitle(_), .updateTitle(_)):
            return true
        case (.setLoading(_), .setLoading(_)):
            return true
        case (.showLaunchList(_), .showLaunchList(_)):
            return true
        default:
            return false
        }
    }
    
    case updateTitle(String)
    case setLoading(Bool)
    case showLaunchList([LaunchPresentation])
}

enum LaunchListRoute {
    case detail(LaunchDetailViewModelType)
}

protocol LaunchListViewModelDelegate: class {
    func handleViewModelOutput(_ output: LaunchListViewModelOutput)
    func navigate(to route: LaunchListRoute)
}
