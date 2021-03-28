//
//  DateView.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import UIKit

class DateView: FormElementView {
    
    let datePicker = UIDatePicker()
    
    override init(connectedElement: ServiceElement?) {
        super.init(connectedElement: connectedElement)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUp() {
        clipsToBounds = true
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        datePicker.date = formatter.date(from: connectedElement?.value ?? "") ?? Date()
        datePicker.addAction(UIAction(handler: { _ in
            self.connectedElement?.value = formatter.string(from: self.datePicker.date)
        }), for: .editingChanged)
        addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            datePicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            datePicker.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            datePicker.heightAnchor.constraint(equalToConstant: 50),
            heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
