//
//  LaunchListBuilder.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation

final class LaunchListBuilder {
    static func make() -> LaunchListViewController {
        let viewController = LaunchListViewController()
        viewController.viewModel = LaunchListViewModel(service: app.service)
        return viewController
    }
}
