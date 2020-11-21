//
//  LaunchDetailViewModel.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import Foundation

final class LaunchDetailViewModel: LaunchDetailViewModelType {
    
    // MARK: Properties
    
    weak var delegate: LaunchDetailViewModelDelegate?
    private var presentation: LaunchPresentation
    
    // MARK: init
    
    init(launch: LaunchPresentation) {
        self.presentation = launch
    }
    
    // MARK: Funcs
    
    func load() {
        delegate?.showDetail(presentation)
    }
}
