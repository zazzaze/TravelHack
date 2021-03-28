//
//  PickerView.swift
//  Domodedovo
//
//  Created by Егор on 28.03.2021.
//

import UIKit
import MaterialComponents.MaterialTextFields
import DropDown

class PickerView: FormElementView {
    let textField = MDCFilledTextField()
    private let dropDown = DropDown()
    
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
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.isEnabled = false
        textField.text = connectedElement?.value
        
        addSubview(textField)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openDropDownView))
        tapGesture.numberOfTapsRequired = 1
        addGestureRecognizer(tapGesture)
    
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc func openDropDownView() {
        let data = self.connectedElement?.valueDefinition?.components(separatedBy: ";") ?? []
        dropDown.dataSource = data
        dropDown.anchorView = textField
        dropDown.bottomOffset = CGPoint(x: 0, y: textField.frame.size.height)
        dropDown.show()
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.textField.text = item
            self?.connectedElement?.value = item
        }
    }

}
