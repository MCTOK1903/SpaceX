//
//  LaunchDetailViewController.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import UIKit
import SDWebImage

class LaunchDetailViewController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: LaunchDetailViewModelType?

    // MARK: View
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let launchImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.backgroundColor = .white
        return image
    }()
    
    var launchMissionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let horizontalStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fill
        sv.axis = .horizontal
        sv.spacing = 32
        return sv
    }()
    
    var rocketNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    var launchYearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    var launchDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.backgroundColor = .white
        return label
    }()
    
    // MARK: Liefcycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.delegate = self
        viewModel?.load()
        
        view.addSubview(scrollView)
        scrollView.addSubview(launchImage)
        scrollView.addSubview(launchMissionNameLabel)
        scrollView.addSubview(horizontalStack)
        horizontalStack.addSubview(rocketNameLabel)
        horizontalStack.addSubview(launchYearLabel)
        scrollView.addSubview(launchDetailLabel)
        
        setUpUI()
    }
    
    // MARK: Funcs
    
    func setUpUI() {
        
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            launchImage.topAnchor.constraint(equalTo: scrollView.topAnchor,  constant: 8),
            launchImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            launchImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            launchImage.heightAnchor.constraint(equalToConstant: view.frame.height/2),
            
            launchMissionNameLabel.topAnchor.constraint(equalTo: launchImage.bottomAnchor, constant: 32),
            launchMissionNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,  constant: 16),
            launchMissionNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            horizontalStack.topAnchor.constraint(equalTo: launchMissionNameLabel.bottomAnchor, constant: 16),
            horizontalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horizontalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            rocketNameLabel.topAnchor.constraint(equalTo: horizontalStack.topAnchor),
            rocketNameLabel.leadingAnchor.constraint(equalTo: horizontalStack.leadingAnchor, constant: 16),
            rocketNameLabel.bottomAnchor.constraint(equalTo: horizontalStack.bottomAnchor),
            
            launchYearLabel.topAnchor.constraint(equalTo: horizontalStack.topAnchor),
            launchYearLabel.trailingAnchor.constraint(equalTo: horizontalStack.trailingAnchor, constant: -16),
            launchYearLabel.bottomAnchor.constraint(equalTo: horizontalStack.bottomAnchor),
            
            launchDetailLabel.topAnchor.constraint(equalTo: horizontalStack.bottomAnchor, constant: 16),
            launchDetailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            launchDetailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            launchDetailLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
}

// MARK: -LaunchDetailViewModelDelegate
extension LaunchDetailViewController: LaunchDetailViewModelDelegate {
    func showDetail(_ presentation: LaunchPresentation) {
        let urlImage = URL(string: presentation.bigImageLink)
        self.launchImage.sd_setImage(with: urlImage)
        self.launchMissionNameLabel.text = "Mission Name: \(presentation.missionName)"
        self.rocketNameLabel.text = "Rocket Name: \(presentation.rocketName)"
        self.launchYearLabel.text = "Year: \(presentation.launchYear)"
        self.launchDetailLabel.text = presentation.detail
    }
}
