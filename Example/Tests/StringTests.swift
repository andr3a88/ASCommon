//
//  StringTests.swift
//  ASCommon_Tests
//
//  Created by Andrea on 12/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import XCTest
import ASCommon

class StringTests: XCTestCase {
    
    func testNilIfEmpty() {

        let label = UILabel()
        label.text = ""
        XCTAssertNil(label.text.nilIfEmpty)
        
        label.text = nil
        XCTAssertNil(label.text.nilIfEmpty)
        
        label.text = "text"
        XCTAssertNotNil(label.text.nilIfEmpty)
    }
    
    func testTrim() {
        
        var string = " Ciao Ciao \n"
        XCTAssert(string.trim() == "Ciao Ciao")
        
        string = "\n Ciao Ciao \n"
        XCTAssert(string.trim() == "Ciao Ciao")
        
        string = "123 "
        XCTAssert(string.trim() == "123")
    }
    
    func testTrimCapitalized() {
        
        var string = " ciao Ciao \n"
        XCTAssert(string.trimCapitalized() == "Ciao Ciao")
        
        string = "\n ciao Ciao \n"
        XCTAssert(string.trimCapitalized() == "Ciao Ciao")
        
        string = "123 "
        XCTAssert(string.trimCapitalized() == "123")
    }
    
    func testEqualsCaseInsensitive() {
        let a = "CaseInsensitive"
        let b = "caseInsensitive"
        XCTAssertTrue(a.equalsInsensitive(b))
    }
}
