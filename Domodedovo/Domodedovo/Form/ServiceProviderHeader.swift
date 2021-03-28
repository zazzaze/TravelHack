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
    var bookingId: Int64
    var extBookingId: String?
    var bookingStatus: Int32
    var currentWizardStep: Int32
    var prefLanguage: String?
    var paymentStatus: Int32?
}
