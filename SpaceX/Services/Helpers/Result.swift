//
//  Result.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
