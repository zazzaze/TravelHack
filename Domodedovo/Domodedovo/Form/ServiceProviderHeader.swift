//
//  ServiceHeader.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import Foundation

class ServiceProviderHeader: Codable {
    var serviceID: String
    var description: String?
    var bookingID: Int64
    var extBookingID: String
    var bookingStatus: Int32
    var currentWizardStep: Int32
    var prefLanguage: String
    var paymentStatus: Int32?
}
