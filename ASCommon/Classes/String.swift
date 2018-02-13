//
//  String.swift
//  ASCommon
//
//  Created by Andrea on 12/01/2018.
//

import Foundation

public extension Optional where Wrapped == String {
    
    /// Handling empty optional strings
    var nilIfEmpty: String? {
        guard let strongSelf = self else {
            return nil
        }
        return strongSelf.isEmpty ? nil : strongSelf
    }
}

public extension String {
    
    /// Trim the string " Hello World ".trim()  result = "Hello World"
    ///
    /// - Returns: The string trimmed
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    }
    
    /// Trim the string " hello World ".trimCapitalized()  result = "Hello World"
    ///
    /// - Returns: The string trimmed
    func trimCapitalized() -> String {
        return self.trim().capitalized
    }
    
    /// String comparison case insensitive
    ///
    /// - Parameter string: The string to compare
    /// - Returns: True if equals
    func equalsInsensitive(_ string: String) -> Bool {
        return self.lowercased() == string.lowercased()
    }
    
    /// Localized string
    ///
    /// - Parameters:
    ///   - bundle: The strings bundle
    ///   - tableName: The table name (default localizable)
    /// - Returns: The string localized
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
