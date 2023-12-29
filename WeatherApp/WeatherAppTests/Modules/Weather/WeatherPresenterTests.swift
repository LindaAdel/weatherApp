//
//  WeatherPresenterTests.swift
//  WeatherAppTests
//
//  Created by Linda adel on 29/12/2023.
//

import XCTest
@testable import WeatherApp

class WeatherPresenterTests: XCTestCase {
    var sut: WeatherPresenter!
    var viewMock: WeatherDisplayLogicMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = WeatherPresenter()
        viewMock = WeatherDisplayLogicMock()
        sut.view = viewMock
    }

    override func tearDownWithError() throws {
        sut = nil
        viewMock = nil
        try super.tearDownWithError()
    }

    func testPresentWeatherInformation() {
        // Given
        let current = CurrentWeatherDataModel(temp_c: 5, is_day: 5, condition:nil, wind_mph: 5, precip_mm: 5, humidity: 5, cloud: 5, feelslike_c: 5, uv: 5)
        let forcastDay = ForecastDayInformationDataModel(date: "2023-12-29", day: WeatherDayDataModel(maxtemp_c: 5, mintemp_c: 5, condition: nil))
        let forecastArray = [forcastDay, forcastDay]
        let forecast = WeatherForecastDataModel(forecastday: forecastArray)

        let weatherResponse = WeatherResponse(location: nil, current: current, forecast: forecast) // Create a mock weather response object
        // Create a mock forecast array
        
        let response = WeatherModel.Fetch.Response(weatherModel: weatherResponse)
        
        // Set up the expectation
        let expectation = XCTestExpectation(description: "Weather information should be displayed")
        viewMock.displayWeatherInformationClosure = { viewModel in
            XCTAssertEqual(viewModel.WeatherForecastDataStoreModel?.first?.date, forecastArray.first?.date)
            expectation.fulfill()
        }
        
        // When
        sut.presentWeatherInformation(response: response)
        
        // Then
        wait(for: [expectation], timeout: 10.0)
        XCTAssertTrue(viewMock.displayWeatherInformationCalled)
    }
}

// MARK: - Test doubles

class WeatherDisplayLogicMock: WeatherDisplayLogic {
    var displayWeatherInformationCalled = false
    var displayWeatherInformationClosure: ((WeatherModel.Fetch.ViewModel) -> Void)?
    
    func displayWeatherInformation(viewModel: WeatherModel.Fetch.ViewModel) {
        displayWeatherInformationCalled = true
        displayWeatherInformationClosure?(viewModel)
    }
}
