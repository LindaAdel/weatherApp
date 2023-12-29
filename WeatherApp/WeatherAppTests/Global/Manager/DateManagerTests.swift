//
//  DateManagerTests.swift
//  WeatherAppTests
//
//  Created by Linda adel on 29/12/2023.
//

import XCTest
@testable import WeatherApp

final class DateManagerTests: XCTestCase {
    var dateManager: DateManager!
    
    override func setUp() {
        super.setUp()
        dateManager = DateManager.DateManagerSharedInstance
    }
    
    override func tearDown() {
        dateManager = nil
        super.tearDown()
    }
    
    func testGetCurrentDate() {
        // Given
        let expectedFormat = "EEEE, MMM d"
        
        // When
        let currentDate = dateManager.getCurrentDate()
        
        // Then
        XCTAssertTrue(!currentDate.isEmpty)
    }
    
    func testGetWeekDay() {
        // Given
        let inputDate = "2023-12-29"
        let expectedWeekDay = "Friday"
        
        // When
        let weekDay = dateManager.getWeekDay(from: inputDate)
        
        // Then
        XCTAssertEqual(weekDay, expectedWeekDay)
    }
    
    func testGetWeekDay_InvalidDate() {
        // Given
        let inputDate = "2023-99-99"
        
        // When
        let weekDay = dateManager.getWeekDay(from: inputDate)
        
        // Then
        XCTAssertTrue(weekDay.isEmpty)
    }
}
