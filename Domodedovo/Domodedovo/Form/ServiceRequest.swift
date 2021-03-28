//
//  ServiceRequest.swift
//  Domodedovo
//
//  Created by Егор on 28.03.2021.
//

import Foundation
class ServiceRequest: Codable {
    var serviceProviderHeader: ServiceProviderHeader
    var serviceFormPage: ServiceFormPage
    var validationError: String
    var bookingFee: BookingFee
    var termConditionalURL: String
}
