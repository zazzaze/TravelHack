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
    var stringValue: String {
        switch self {
        case .getService:
            return "\(Endpoints.baseEndpoint)form"
        }
    }
    var url: URL {
        URL(string: stringValue)!
    }
}
