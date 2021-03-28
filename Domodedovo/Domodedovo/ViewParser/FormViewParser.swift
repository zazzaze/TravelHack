//
//  FormViewParser.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import Foundation
import UIKit

class FormViewParser {
    func parse(serviceFormPage: ServiceFormPage) -> FormView     {
        var elementForms = [ElementsForm]()
        for formElement in serviceFormPage.serviceFormElements {
            elementForms.append(createElementView(for: formElement))
        }
        let formView = FormView(elementForms: elementForms)
        formView.titleLabel.text = serviceFormPage.title
        return formView
    }
    
    func createElementView(for serviceFormElement: ServiceFormElement) -> ElementsForm {
        let elementsForm = ElementsForm()
        var subviews = [FormElementView]()
        for element in serviceFormElement.serviceElements {
            switch element.elementType {
            case .text:
                subviews.append(createTextView(from: element))
                break
            case .textbox:
                subviews.append(createTextBox(from: element))
                break
            case .date:
                subviews.append(createDateView(from: element))
                break
            case .time:
                subviews.append(createTimeView(from: element))
                break
            case .telephone:
                subviews.append(createTelephoneView(from: element))
                break
            case .selectList:
                subviews.append(createSelectList(from: element))
                break
            default:
                break
            }
        }
        elementsForm.addFormElementViews(subviews)
        return elementsForm
    }
    
    private func createTextView(from serviceElement: ServiceElement) -> FormElementView {
        let textView = TextView(connectedElement: serviceElement)
        textView.titleLabel.text = serviceElement.contentValue
        return textView
    }
    
    private func createTextBox(from serviceElement: ServiceElement) -> FormElementView {
        let textboxView = TextBoxView(connectedElement: serviceElement)
        textboxView.titleLabel.text = serviceElement.contentValue
        return textboxView
    }
    
    private func createDateView(from serviceElement: ServiceElement) -> FormElementView {
        let dateView = DateView(connectedElement: serviceElement)
        dateView.titleLabel.text = serviceElement.contentValue
        return dateView
    }
    
    private func createTimeView(from serviceElement: ServiceElement) -> FormElementView {
        let timeView = TimeView(connectedElement: serviceElement)
        timeView.titleLabel.text = serviceElement.contentValue
        return timeView
    }
    
    private func createTelephoneView(from serviceElement: ServiceElement) -> FormElementView {
        let telephoneView = TelephoneView(connectedElement: serviceElement)
        telephoneView.titleLabel.text = serviceElement.contentValue
        return telephoneView
    }
    
    private func createSelectList(from serviceElement: ServiceElement) -> FormElementView {
        let pickerView = PickerView(connectedElement: serviceElement)
        pickerView.titleLabel.text = serviceElement.contentValue
        return pickerView
    }
}
