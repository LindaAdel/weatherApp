//
//  WeatherInteractorTests.swift
//  WeatherAppTests
//
//  Created by Linda adel on 29/12/2023.
//

import XCTest
@testable import WeatherApp
import Combine

class WeatherInteractorTests: XCTestCase {
    var sut: WeatherInteractor!
    var weatherRepositoryMock: WeatherRepositoryDataSourceMock!
    var presenterMock: WeatherPresentationLogicMock!
    var cancellables: Set<AnyCancellable>!
    var assembler: WeatherAssemblerMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        weatherRepositoryMock = WeatherRepositoryDataSourceMock()
        presenterMock = WeatherPresentationLogicMock()
        cancellables = Set<AnyCancellable>()
        assembler = WeatherAssemblerMock.shareInstance
        
        sut = WeatherInteractor()
        assembler.assemble()
        DIContainer.shared.register(weatherRepositoryMock)
        
        sut.presenter = presenterMock
    }

    override func tearDownWithError() throws {
        sut = nil
        weatherRepositoryMock = nil
        presenterMock = nil
        cancellables = nil
        assembler = nil
        try super.tearDownWithError()
    }

    
    func testLoadWeatherFailure() {
        // Given
        let expectedError = APIError() // Create an expected error
        
        // Set up the expectation
        let expectation = XCTestExpectation(description: "Error should be logged")
        
        // Stub the weather repository to return a failure
        weatherRepositoryMock.getWeatherInformationClosure = { countryCode in
            return Fail(error: expectedError).eraseToAnyPublisher()
        }

        // When
        let request = WeatherModel.Fetch.Request(countryCode: "egypt") // Provide a valid country code
        sut.loadWeather(request: request)
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Assert that the error was logged
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
}

class WeatherPresentationLogicMock: WeatherPresentationLogic {
    var presentWeatherInformationCalled = false
    var presentWeatherInformationClosure: ((WeatherModel.Fetch.Response) -> Void)?
    
    func presentWeatherInformation(response: WeatherModel.Fetch.Response) {
        presentWeatherInformationCalled = true
        presentWeatherInformationClosure?(response)
    }
}

class WeatherRepositoryDataSourceMock: WeatherRepositoryDataSource {
    var getWeatherInformationCalled = false
    var getWeatherInformationClosure: ((String) -> AnyPublisher<WeatherResponse, APIError>)?
    
    func getWeatherInformation(countryCode: String) -> AnyPublisher<WeatherResponse, APIError> {
        getWeatherInformationCalled = true
        return getWeatherInformationClosure?(countryCode) ?? Empty().eraseToAnyPublisher()
    }
}
