//
//  Localizable.swift
//  ASCommon
//
//  Created by Andrea on 12/01/2018.
//

import Foundation

public protocol Localizable {
    var tableName: String { get }
    var localized: String { get }
}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {
    var localized: String {
        return rawValue.localized(tableName: tableName)
    }
}
