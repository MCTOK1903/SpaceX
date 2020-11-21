//
//  LaunchListViewModel.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation

final class LaunchListViewModel: LaunchListViewModelType {
    
    // MARK: Properties
    
    var delegate: LaunchListViewModelDelegate?
    private let service: LaunchServiceProtocol
    private var launches: [Launch] = []
    
    // MARK: Init
    
    init(service: LaunchServiceProtocol) {
        self.service = service
    }
    
    // MARK: Funcs
    
    func load() {
        notify(.updateTitle("Launches"))
        
        notify(.setLoading(true))
        
        service.fetchLaunch { [weak self] (response) in
            
            guard let self = self else { return }
            
            self.notify(.setLoading(false))
            
            switch response {
            case .success(let response):
                self.launches = response
                let presentationLaunches = response.map({LaunchPresentation.init(launch: $0)})
                self.notify(.showLaunchList(presentationLaunches))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectLaunch(at index: Int) {
        //Todo
    }
    
    private func notify(_ output: LaunchListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
