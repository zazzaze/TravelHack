//
//  BookIdData.swift
//  Domodedovo
//
//  Created by Егор on 28.03.2021.
//

import Foundation

class BookIdData {
    private var ids = [Int64]()
    static var shared = BookIdData()
    public func addId(_ id: Int64) {
        ids.append(id)
    }
    public func getIds() -> [Int64] {
        ids
    }
}
