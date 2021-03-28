//
//  TimeView.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import UIKit

class TimeView: DateView {
    
    override init(connectedElement: ServiceElement?) {
        super.init(connectedElement: connectedElement)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        datePicker.datePickerMode = .time
    }
}
