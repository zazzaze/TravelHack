//
//  TextBoxView.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import UIKit
import MaterialComponents.MaterialTextFields

class TextBoxView: FormElementView {

    var textField = MDCOutlinedTextField()
    
    override init(connectedElement: ServiceElement?) {
        super.init(connectedElement: connectedElement)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUp() {
        textField.sizeToFit()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addAction(UIAction(handler: { _ in
            self.connectedElement?.value = self.textField.text
        }), for: .editingChanged)
        textField.text = connectedElement?.value
        addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
