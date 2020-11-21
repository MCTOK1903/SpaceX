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
    func selectLaunch(at index: Int)
}

enum LaunchListViewModelOutput: Equatable {
    
    static func == (lhs: LaunchListViewModelOutput, rhs: LaunchListViewModelOutput) -> Bool {
        switch (lhs, rhs) {
        case (.updateTitle(let a), .updateTitle(let b)):
            return a == b
        case (.setLoading(let a), .setLoading(let b)):
            return a == b
        case (.showLaunchList(let a), .showLaunchList(let b)):
            return a == b
        default:
            return false
        }
    }
    
    case updateTitle(String)
    case setLoading(Bool)
    case showLaunchList([LaunchPresentation])
}

protocol LaunchListViewModelDelegate: class {
    func handleViewModelOutput(_ output: LaunchListViewModelOutput)
}
