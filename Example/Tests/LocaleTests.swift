//
//  LocaleTests.swift
//  ASCommon_Tests
//
//  Created by Andrea on 12/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import XCTest
import ASCommon

class LocaleTests: XCTestCase {
    
    func testPreferredLanguage() {
        XCTAssert(Locale.current.preferredLanguage == "en")
    }
    
    func testIsPreferredLanguage() {
        XCTAssertFalse( Locale.current.isPreferredLanguage("it"))
        XCTAssertTrue( Locale.current.isPreferredLanguage("en"))
    }
}


