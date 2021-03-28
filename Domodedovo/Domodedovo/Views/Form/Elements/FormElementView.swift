//
//  FormElementView.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import UIKit

class FormElementView: UIView {

    var connectedElement: ServiceElement?
    let titleLabel = UILabel()
    
    init(connectedElement: ServiceElement?) {
        super.init(frame: .zero)
        self.connectedElement = connectedElement
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        titleLabel.textColor = UIColor(named: "Main")
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

}
