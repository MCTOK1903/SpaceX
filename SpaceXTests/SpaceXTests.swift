//
//  SpaceXTests.swift
//  SpaceXTests
//
//  Created by MCT on 21.11.2020.
//

import XCTest
@testable import SpaceX

class SpaceXTests: XCTestCase {

    func testParsing() throws {
        let bundle = Bundle(for: SpaceXTests.self)
        let url = bundle.url(forResource: "Launch", withExtension: ".json")!
        let data = try Data(contentsOf: url)
        let decoder = Decoder.launchDecoder
        let launch = try decoder.decode([Launch].self, from: data)
        
        XCTAssertEqual(launch.first?.flightNumber, 1)
        XCTAssertEqual(launch.first?.missionName, "FalconSat")
        XCTAssertEqual(launch.first?.launchYear, "2006")
        XCTAssertEqual(launch.first?.rocket.rocketId, "falcon1")
        XCTAssertEqual(launch.first?.rocket.rocketName, "Falcon 1")
        XCTAssertEqual(launch.first?.rocket.rocketType, "Merlin A")
        XCTAssertEqual(launch.first?.links.missionImage, "https://images2.imgbox.com/40/e3/GypSkayF_o.png")
        XCTAssertEqual(launch.first?.links.missionImageSmall, "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png")
        XCTAssertEqual(launch.first?.links.articleLink, "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html")
        XCTAssertEqual(launch.first?.links.wikipediaLink, "https://en.wikipedia.org/wiki/DemoSat")
        XCTAssertEqual(launch.first?.links.videoLink, "https://www.youtube.com/watch?v=0a_00nJ_Y88")
        XCTAssertEqual(launch.first?.details, "Engine failure at 33 seconds and loss of vehicle")
    }
    /*
     {
             "flight_number": 1,
             "mission_name": "FalconSat"
             "launch_year": "2006",
             "rocket": {
                 "rocket_id": "falcon1",
                 "rocket_name": "Falcon 1",
                 "rocket_type": "Merlin A"
             },
             "links": {
                 "mission_patch": "https://images2.imgbox.com/40/e3/GypSkayF_o.png",
                 "mission_patch_small": "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png",
                 "article_link": "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html",
                 "wikipedia": "https://en.wikipedia.org/wiki/DemoSat",
                 "video_link": "https://www.youtube.com/watch?v=0a_00nJ_Y88",
                 "youtube_id": "0a_00nJ_Y88",
             },
             "details": "Engine failure at 33 seconds and loss of vehicle"
         },
     */
}
