//
//  MockView.swift
//  SpaceXTests
//
//  Created by MCT on 21.11.2020.
//

import Foundation
@testable import SpaceX

final class MockView: LaunchListViewModelDelegate {
    
    var outputs: [LaunchListViewModelOutput] = []
    
    func handleViewModelOutput(_ output: LaunchListViewModelOutput) {
        outputs.append(output)
    }
}
