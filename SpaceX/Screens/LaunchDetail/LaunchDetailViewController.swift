//
//  LaunchDetailViewController.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import UIKit

class LaunchDetailViewController: UIViewController {
    
    var viewModel: LaunchDetailViewModelType!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        viewModel.load()
        
        view.backgroundColor = .red
    }
}

extension LaunchDetailViewController: LaunchDetailViewModelDelegate {
    func showDetail(_ presentation: LaunchPresentation) {
        //Todo
        print(presentation.missionName)
    }
}
