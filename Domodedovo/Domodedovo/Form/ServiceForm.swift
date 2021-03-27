//
//  ServiceForm.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import Foundation

class ServiceForm: Codable {
    var id: Int64
    var serviceFormPages: [ServiceFormPage]
}
