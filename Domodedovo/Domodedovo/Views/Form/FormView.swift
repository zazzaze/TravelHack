//
//  FormView.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import UIKit

class FormView: UIView {
    
    let titleLabel: UILabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    private func setUp() {
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
        configureTitleLabel()
    }
    
    private func configureTitleLabel() {
        titleLabel.textColor = UIColor(named: "Primary")
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 65),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
        ])
    }
    
    func addServiceFormView(_ view: UIView) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
