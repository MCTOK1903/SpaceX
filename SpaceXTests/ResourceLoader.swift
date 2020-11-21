//
//  ResourceLoader.swift
//  SpaceXTests
//
//  Created by MCT on 21.11.2020.
//

import Foundation
@testable import SpaceX

class ResourceLoader {
    
    static func loadLaunch() throws -> [Launch]{
        let bundle = Bundle.test
        let url = bundle.url(forResource: "launch", withExtension: ".json")!
        let data = try Data(contentsOf: url)
        let decoder = Decoder.launchDecoder
        let launches = try decoder.decode([Launch].self, from: data)
        return launches
    }
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}
