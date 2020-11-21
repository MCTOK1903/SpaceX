//
//  LaunchDetailViewModelType.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation

protocol LaunchDetailViewModelType {
    var delegate: LaunchDetailViewModelDelegate? { get set }
    func load()
}

protocol LaunchDetailViewModelDelegate: class {
    func showDetail(_ presentation: LaunchPresentation)
}
