//
//  ServiceCollectionViewCell.swift
//  Domodedovo
//
//  Created by Егор on 28.03.2021.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    let nextImage: UIImageView = {
        let nextImage = UIImageView()
        nextImage.image = UIImage(named: "rightArrow")
        nextImage.translatesAutoresizingMaskIntoConstraints = false
        nextImage.contentMode = .scaleAspectFill
        return nextImage
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    private func setUp() {
        contentView.insetsLayoutMarginsFromSafeArea = false
        layer.cornerRadius = 15
        backgroundColor = .lightGray
        contentView.addSubview(titleLabel)
        addSubview(nextImage)
        initConstraints()
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: nextImage.leadingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 10),
            
            nextImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nextImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            nextImage.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 10),
            nextImage.widthAnchor.constraint(equalToConstant: 20),
            nextImage.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
