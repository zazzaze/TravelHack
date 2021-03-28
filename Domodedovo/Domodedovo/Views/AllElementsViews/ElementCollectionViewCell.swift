//
//  ElementCollectionViewCell.swift
//  Domodedovo
//
//  Created by Егор on 28.03.2021.
//

import UIKit

class ElementCollectionViewCell: UICollectionViewCell {
    let titleLabel = UILabel()
    let burgerImage = UIImageView()
    var state: ElementState = .disable {
        didSet {
            updateStatus()
        }
    }
    
    var statusImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        titleLabel.textColor = UIColor(named: "Main")
        titleLabel.font = UIFont.systemFont(ofSize: 19)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        burgerImage.image = UIImage(named: "burger")
        burgerImage.translatesAutoresizingMaskIntoConstraints = false
        
        statusImage.translatesAutoresizingMaskIntoConstraints = false
        statusImage.isHidden = true
        
        
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "Main")?.cgColor
        layer.cornerRadius = 15
        contentView.addSubview(titleLabel)
        contentView.addSubview(burgerImage)
        contentView.addSubview(statusImage)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: statusImage.trailingAnchor, constant: -10),
            
            burgerImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            burgerImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            burgerImage.heightAnchor.constraint(equalToConstant: 20),
            burgerImage.widthAnchor.constraint(equalToConstant: 20),
            
            statusImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            statusImage.trailingAnchor.constraint(equalTo: burgerImage.leadingAnchor, constant: -10),
            statusImage.heightAnchor.constraint(equalToConstant: 20),
            statusImage.widthAnchor.constraint(equalToConstant: 20),
            
        ])
    }
    
    private func updateStatus() {
        if state == .disable {
            layer.borderColor = UIColor.lightGray.cgColor
            titleLabel.textColor = .lightGray
            burgerImage.tintColor = .lightGray
            isUserInteractionEnabled = false
            statusImage.isHidden = true
        } else if state == .success {
            layer.borderColor = UIColor(named: "Main")?.cgColor
            titleLabel.textColor = UIColor(named: "Main")
            burgerImage.tintColor = UIColor(named: "Main")
            statusImage.isHidden = false
            isUserInteractionEnabled = true
            statusImage.image = UIImage(named: "success")
        } else {
            layer.borderColor = UIColor(named: "Main")?.cgColor
            titleLabel.textColor = UIColor(named: "Main")
            burgerImage.tintColor = UIColor(named: "Main")
            isUserInteractionEnabled = true
            statusImage.isHidden = true
        }
    }
}

enum ElementState: Int32 {
    case success = 0
    case active = 1
    case disable = 2
}
