//
//  Endpoints.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import Foundation

enum Endpoints {
    private static let baseEndpoint = "http://188.120.233.197/api/"
    case getService
    case book
    case reg
    var stringValue: String {
        switch self {
        case .getService:
            return "\(Endpoints.baseEndpoint)form/"
        case .reg: return "\(Endpoints.baseEndpoint)serviceBooking/"
        case .book: return "\(Endpoints.baseEndpoint)bookingElements/"
        }
    }
    var url: URL {
        URL(string: stringValue)!
    }
}
