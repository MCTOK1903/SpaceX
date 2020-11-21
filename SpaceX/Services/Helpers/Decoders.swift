//
//  Decoders.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation

public enum Decoder {
    static let launchDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
}
