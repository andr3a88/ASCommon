//
//  Commons.swift
//  ASCommon
//
//  Created by Andrea on 12/01/2018.
//

import Foundation

// MARK: HTTPCookieStorage

public extension HTTPCookieStorage {

    func clear() {
        guard let cookies = self.cookies else { return }
        cookies.forEach { self.deleteCookie($0) }
    }
}

// MARK: Sequence

public extension Sequence where Element: Numeric {

    var sum: Element {
        return self.reduce(0, +)
    }
}

public extension Sequence {

    func count(where predicate: (Element) -> Bool) -> Int {
        var count = 0
        for element in self {
            if predicate(element) {
                count += 1
            }
        }
        return count
    }
}

// MARK: Array

public extension Array where Element: BinaryFloatingPoint {

    var average: Element {
        return self.reduce(0, +) / Element(self.count)
    }
}

public extension Array {
    func chunk(size: Int) -> [[Element]] {
        let steps = stride(from: self.startIndex,
                           to: self.endIndex,
                           by: size)
        return steps.map({ i -> [Element] in
            let end = self.index(i,
                                 offsetBy: size,
                                 limitedBy: self.endIndex) ?? self.endIndex
            return Array(self[i ..< end])
        })
    }
}

// MARK: Collection

public extension Collection {
    
    /// Safe object at index
    ///
    /// - Parameter index: The index
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

// MARK: CGRect

public extension CGRect {
    
    /// The CGRect center
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
}

// MARK: CGSize

public extension CGSize {
    
    /// Change an existing CGSize by a width delta and a height delta
    ///
    /// - Parameters:
    ///   - dw: width delta
    ///   - dh: height delta
    /// - Returns: new CGSize
    func sizeByDelta(dw: CGFloat, dh: CGFloat) -> CGSize {
        return CGSize(width: self.width + dw, height: self.height + dh)
    }
}

// MARK: URL

public extension URL {

    init(staticString: StaticString) {
        self.init(string: "\(staticString)")!
    }
}

public extension Int {

    /// Double type
    var double: Double {
        return Double(self)
    }

    /// Float type
    var float: Float {
        return Float(self)
    }

    #if canImport(CoreGraphics)
    /// Float CGFloat
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    #endif

    /// Returns random number up to
    ///
    /// - Parameter max: The max value
    /// - Returns: The randon number
    static func random(upTo max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }
}
