//
//  LaunchViewModelTests.swift
//  SpaceXTests
//
//  Created by MCT on 21.11.2020.
//

import XCTest
@testable import SpaceX

class LaunchViewModelTests: XCTestCase {
    
    // MARK: Properties
    
    private var view: MockView!
    private var viewModel: LaunchListViewModel!
    private var service: MockLaunchService!

    override func setUp() {
        service = MockLaunchService()
        viewModel = LaunchListViewModel(service: service)
        view = MockView()
        viewModel.delegate = view
    }
    
    func testLoad() throws {
        
        //Given:
        let launches = try ResourceLoader.loadLaunch()
        service.launches = launches
        
        //When:
        viewModel.load()
        
        //Then:
        
        XCTAssertEqual(view.outputs.count, 4)
        
        switch view.outputs[0] {
        case .updateTitle(_):
            break // success
        default:
            XCTFail("First output should be updateTitle")
        }
        
        XCTAssertEqual(view.outputs[1], .setLoading(true))
        XCTAssertEqual(view.outputs[2], .setLoading(false))
        
        let expectedLaunches = launches.map(LaunchPresentation.init)
        XCTAssertEqual(view.outputs[3], .showLaunchList(expectedLaunches))
    }
}
