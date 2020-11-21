//
//  MockLaunchService.swift
//  SpaceXTests
//
//  Created by MCT on 21.11.2020.
//

import Foundation
@testable import SpaceX

final class MockLaunchService: LaunchServiceProtocol {
    
    var launches: [Launch] = []
    
    func fetchLaunch(completion: @escaping (Result<[Launch]>) -> Void) {
        completion(.success(launches))
    }
}
