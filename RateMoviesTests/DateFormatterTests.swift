//
//  DateFormatterTests.swift
//  RateMoviesTests
//
//

import XCTest

class DateFormatterTests: XCTestCase {
    
    func testSpanishFormattedDate_ValidDate_ReturnsFormattedString() {
        // Arrange
        let dateString = "2024-04-30"
        
        // Act
        let formattedDate = DateFormatter.spanishFormattedDate(from: dateString)
        
        // Assert
        XCTAssertEqual(formattedDate, "30 Abr 2024", "The formatted date should be '30 Abr 2024'")
    }
    
    func testSpanishFormattedDate_InvalidDate_ReturnsNil() {
        // Arrange
        let dateString = "InvalidDate"
        
        // Act
        let formattedDate = DateFormatter.spanishFormattedDate(from: dateString)
        
        // Assert
        XCTAssertNil(formattedDate, "The formatted date should be nil for an invalid date string")
    }
}
