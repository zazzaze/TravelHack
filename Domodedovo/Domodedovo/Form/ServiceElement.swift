//
//  ServiceElement.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import Foundation

class ServiceElement: Codable {
    var id: Int64
    var elementType: ElementType
    var valueDefinition: String?
    var value: String?
    var descriptionText: String?
    var editable: Bool?
    var contentCategory: ContentCategory?
    var contentKey: String?
    var contentValue: String?
    var mandatory: Bool?
    var errorText: String?
}
