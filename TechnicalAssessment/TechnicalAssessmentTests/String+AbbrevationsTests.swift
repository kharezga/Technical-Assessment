//
//  String+AbbrevationsTests.swift
//  TechnicalAssessmentTests
//
//  Created by Harezga Kacper on 11/12/2023.
//

import XCTest
@testable import TechnicalAssessment

final class String_AbbrevationsTests: XCTestCase {
    func testRoundedToTwoDecimalPlaces() {
        XCTAssertEqual("123.456".roundedToTwoDecimalPlaces(), "123.46", "Should round to two decimal places")
        XCTAssertEqual("123".roundedToTwoDecimalPlaces(), "123.00", "Should handle no decimal numbers")
        XCTAssertEqual("abc".roundedToTwoDecimalPlaces(), "abc", "Should handle non-numeric strings")
        XCTAssertEqual("-123.456".roundedToTwoDecimalPlaces(), "-123.46", "Should handle negative numbers")
    }
    
    func testFormatedAsCurrencyAbbreviation() {
        XCTAssertEqual("1000".formatedAsCurrencyAbbreviation(), "$1.00K", "Should format thousands correctly")
        XCTAssertEqual("1000000".formatedAsCurrencyAbbreviation(), "$1.00M", "Should format millions correctly")
        XCTAssertEqual("1000000000".formatedAsCurrencyAbbreviation(), "$1.00B", "Should format billions correctly")
        XCTAssertEqual("123".formatedAsCurrencyAbbreviation(), "$123.00", "Should handle amounts less than 1000")
        XCTAssertEqual("abc".formatedAsCurrencyAbbreviation(), "abc", "Should handle non-numeric strings")
        XCTAssertEqual("-1000".formatedAsCurrencyAbbreviation(), "-$1.00K", "Should handle negative thousands")
    }
}
