//
//  Double.swift
//  ASCommon
//
//  Created by Andrea on 12/01/2018.
//

import Foundation

public extension Double {
    
    /// Round the double
    ///
    /// - Parameter places: places (default 0)
    /// - Returns: double rounded
    func roundTo(places: Int = 0) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
