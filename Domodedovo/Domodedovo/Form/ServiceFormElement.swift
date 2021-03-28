//
//  ServiceFormElement.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import Foundation
import UIKit

class ServiceFormElement: Codable {
    var id: Int64
    var title: String
    var subtitle: String?
    var serviceElements: [ServiceElement]
    var footerText: String?
    
    func createViewController() -> ElementViewController {
        let vc = ElementViewController()
        vc.titleLabel.text = title
        vc.addView(FormViewParser().createElementView(for: self))
        return vc
    }
}
