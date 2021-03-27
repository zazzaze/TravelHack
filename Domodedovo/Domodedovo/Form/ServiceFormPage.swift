//
//  ServiceFormPage.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import Foundation

class ServiceFormPage: Codable {
    var id: Int64
    var title: String
    var serviceFormElements: [ServiceFormElement]
    var wizardStep: Int32
}
