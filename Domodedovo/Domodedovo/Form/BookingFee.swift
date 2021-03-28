//
//  BookingFee.swift
//  Domodedovo
//
//  Created by Егор on 28.03.2021.
//

import Foundation

class BookingFee: Codable {
    var preTaxFee: Int64
    var taxRate: Double
    var taxInvoiceText: [String]
    var customInfoText: [String]
    var taxId: String
}
