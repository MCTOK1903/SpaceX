//
//  LaunchListCollectionViewCell.swift
//  SpaceX
//
//  Created by MCT on 21.11.2020.
//

import UIKit

class LaunchListCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    public let identifier = "launchListCollectionViewCell"
    
    // MARK: View
    
    private let horizontalStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .horizontal
        sv.spacing = 16
        return sv
    }()
    
    let launchImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .white
        return iv
    }()
    
    private let verticalStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .equalCentering
        sv.spacing = 4
        sv.axis = .vertical
        return sv
    }()
    
    var launchMissionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
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
    
    // MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(launchImage)
        horizontalStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(launchMissionNameLabel)
        verticalStack.addArrangedSubview(rocketNameLabel)
        verticalStack.addArrangedSubview(launchYearLabel)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Func
    
    func setUpUI() {
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            launchImage.topAnchor.constraint(equalTo: horizontalStack.topAnchor),
            launchImage.leadingAnchor.constraint(equalTo: horizontalStack.leadingAnchor),
            launchImage.bottomAnchor.constraint(equalTo: horizontalStack.bottomAnchor),
//            launchImage.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            
            verticalStack.topAnchor.constraint(equalTo: horizontalStack.topAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: horizontalStack.trailingAnchor, constant: 16),
            verticalStack.bottomAnchor.constraint(equalTo: horizontalStack.bottomAnchor),
            
            launchMissionNameLabel.topAnchor.constraint(equalTo: verticalStack.topAnchor),
            launchMissionNameLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            launchMissionNameLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
            
            rocketNameLabel.topAnchor.constraint(equalTo: launchMissionNameLabel.bottomAnchor),
            rocketNameLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            rocketNameLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
            
            launchYearLabel.topAnchor.constraint(equalTo: rocketNameLabel.bottomAnchor),
            launchYearLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            launchYearLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
        ])
    }
}
