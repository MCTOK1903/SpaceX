//
//  LaunchListViewController.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import UIKit

class LaunchListViewController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: LaunchListViewModelType!
    
    private var launchList: [LaunchPresentation] = []
    
    // MARK: View
    
    private let launchListCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(launchListCollection)
        
        setUpUI()
    }
    
    // MARK: Funcs
    
    func setUpUI() {
        
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            launchListCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            launchListCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            launchListCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            launchListCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension LaunchListViewController: LaunchListViewModelDelegate {
    func handleViewModelOutput(_ output: LaunchListViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .showLaunchList(let launchList):
            self.launchList = launchList
            launchListCollection.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension LaunchListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return launchList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate
extension LaunchListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Todo
    }
}
