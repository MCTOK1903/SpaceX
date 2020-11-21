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

enum LaunchListViewModelOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showLaunchList([LaunchPresentation])
}

protocol LaunchListViewModelDelegate: class {
    func handleViewModelOutput(_ output: LaunchListViewModelOutput)
}
