//
//  LaunchDetailBuilder.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation

final class LaunchDetailBuilder {
    static func make(with viewModel: LaunchDetailViewModelType) -> LaunchDetailViewController {
        let viewController = LaunchDetailViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}
