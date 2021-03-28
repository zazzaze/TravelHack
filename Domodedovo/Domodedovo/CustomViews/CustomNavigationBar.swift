//
//  CustomNavigationBar.swift
//  Domodedovo
//
//  Created by Егор on 28.03.2021.
//

import UIKit


protocol CustomNavigationBarDelegate: class {
    func backButtonTapped()
}

class CustomNavigationBar: UINavigationBar {

    let titleLabel = UILabel()
    let backButton = UIButton()
    var barDelegate: CustomNavigationBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        backgroundColor = .white
        
        layer.cornerRadius = 40
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        layer.masksToBounds = true
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        backButton.setImage(UIImage(named: "Back"), for: .normal)
        backButton.imageView?.tintColor = .white
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.imageView?.contentMode = .scaleAspectFill
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        addSubview(backButton)
        initConstraints()
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15),
            
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc private func backButtonTapped() {
        barDelegate?.backButtonTapped()
    }

}
