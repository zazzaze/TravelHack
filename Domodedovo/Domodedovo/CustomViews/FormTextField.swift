//
//  FormTextField.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import UIKit
import MaterialComponents.MaterialTextFields
class FormTextField: UIView {
    private var myTextField: MDCOutlinedTextField!
    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setOutlineColor(_ color: UIColor, for state: MDCTextControlState) {
        myTextField.setOutlineColor(color, for: state)
    }
    
    public var placeholder: String? {
        get {
            myTextField.placeholder
        }
        set {
            myTextField.placeholder = newValue
        }
    }
    
    public var text: String? {
        get {
            myTextField.text
        }
        set {
            myTextField.text = newValue
        }
    }

    
    private func setUp() {
        isUserInteractionEnabled = true
        myTextField = MDCOutlinedTextField()
        myTextField.label.text = "Phone number"
        myTextField.placeholder = "555-555-5555"
        myTextField.sizeToFit()
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(myTextField)
        
        NSLayoutConstraint.activate([
            myTextField.topAnchor.constraint(equalTo: topAnchor),
            myTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            myTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            myTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
