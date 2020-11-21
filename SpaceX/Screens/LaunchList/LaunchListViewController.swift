//
//  LaunchListViewController.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import UIKit
import SDWebImage

class LaunchListViewController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: LaunchListViewModelType! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    var launchCellViewModel: LaunchListCellViewModelType!
    
    private var launchList: [LaunchPresentation] = []
    
    // MARK: View
    
    private let launchListCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.register(LaunchListCollectionViewCell.self, forCellWithReuseIdentifier: LaunchListCollectionViewCell().identifier)
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        launchListCollection.delegate = self
        launchListCollection.dataSource = self
        
        view.addSubview(launchListCollection)
        
        viewModel.load()
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchListCollectionViewCell().identifier, for: indexPath) as! LaunchListCollectionViewCell
        launchCellViewModel = LaunchListCellViewModel(launch: launchList[indexPath.item])
        cell.launchImage.sd_setImage(with: launchCellViewModel.imageLink)
        cell.launchMissionNameLabel.text = launchCellViewModel.missionName
        cell.rocketNameLabel.text = launchCellViewModel.rocketName
        cell.launchYearLabel.text = launchCellViewModel.launchYear
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension LaunchListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Todo
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension LaunchListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let colums: CGFloat = 1
        let collectioViewWith = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (colums - 1)
        let adjustedWith = collectioViewWith - spaceBetweenCells
        let width: CGFloat = floor(adjustedWith / colums)
        let height = view.frame.height/3
        return CGSize(width: width, height: height)
    }
}
