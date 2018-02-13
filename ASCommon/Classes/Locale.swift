//
//  Locale.swift
//  ASCommon
//
//  Created by Andrea on 12/01/2018.
//

import Foundation

public extension Locale {
    
    /// The app current preferred language
    var preferredLanguage: String? {
        return Locale.preferredLanguages.first?.components(separatedBy: "-").first
    }
    
    /// Determinates if the current app language is the same passed by parameter
    ///
    /// - Parameter languageCode: The language ISO 639-1 code (two-letter code)
    /// - Returns: The result
    func isPreferredLanguage(_ languageCode: String) -> Bool {
        if let firstLanguage = Locale.preferredLanguages.first, let language = firstLanguage.components(separatedBy: "-").first {
            return language == languageCode
        }
        return false
    }
}
