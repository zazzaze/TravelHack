//
//  CustomButton.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import UIKit

class CustomButton: UIButton {
    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUp() {
        layer.cornerRadius = 8
        layer.borderColor = UIColor(named: "Main")?.cgColor
        layer.borderWidth = 2
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        titleLabel?.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    var borderColor: CGColor? {
        get {
            layer.borderColor
        }
        set {
            layer.borderColor = newValue
        }
    }
    
    var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
