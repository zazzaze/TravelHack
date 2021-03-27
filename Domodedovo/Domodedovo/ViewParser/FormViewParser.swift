//
//  FormViewParser.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import Foundation
import UIKit

class FormViewParser {
    func parse(serviceFormPage: ServiceFormPage) -> UIView {
        let formView = FormView()
        formView.titleLabel.text = serviceFormPage.title
        for serviceFormElement in serviceFormPage.serviceFormElements {
            formView.add
        }
        
        return formView
    }
}
