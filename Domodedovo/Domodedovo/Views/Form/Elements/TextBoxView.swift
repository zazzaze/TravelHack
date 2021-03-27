//
//  TextBoxView.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import UIKit
import MaterialComponents.MaterialTextFields

class TextBoxView: UIView {

    var textField = MDCOutlinedTextField()
    
    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        textField.sizeToFit()
        textField.frame = frame
        addSubview(textField)
    }
}
