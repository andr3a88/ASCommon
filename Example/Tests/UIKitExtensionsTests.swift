//
//  UIKitExtensionsTests.swift
//  ASCommon_Tests
//
//  Created by Andrea Stevanato on 27/08/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

class UIKitExtensionsTests: XCTestCase {

    func testTextFieldEmpty() {
        let textField = UITextField()

        textField.text = ""
        XCTAssertTrue(textField.isEmpty)

        textField.text = "not empty"
        XCTAssertFalse(textField.isEmpty)
    }

    func testTextFieldHasValidEmail() {
        let textField = UITextField()

        textField.text = "roger@gmail.com"
        XCTAssertTrue(textField.hasValidEmail)

        textField.text = "roger@@gmail.com"
        XCTAssertFalse(textField.hasValidEmail)
    }
}
