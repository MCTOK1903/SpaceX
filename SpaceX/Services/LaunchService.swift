//
//  LaunchService.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation
import Alamofire

public protocol LaunchServiceProtocol {
    func fetchLaunch(completion: @escaping (Result<[Launch]>) -> Void)
}

public class LaunchService: LaunchServiceProtocol {
    
    public enum Error: Swift.Error {
        case serialaztionError(internal: Swift.Error)
        case NetworkError(internal: Swift.Error)
    }
    
    public init() {}
    
    public func fetchLaunch(completion: @escaping (Result<[Launch]>) -> Void) {
        AF.request(Constant.NetworkConstant.baseURL).responseData { (response) in
            
            switch response.result {
            case .success(let data):
                let decoder = Decoder.launchDecoder
                do {
                    let response = try decoder.decode([Launch].self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(Error.serialaztionError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.NetworkError(internal: error)))
            }
        }
    }
}
