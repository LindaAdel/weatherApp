//
//  WeatherAssemblerMock.swift
//  WeatherAppTests
//
//  Created by Linda adel on 29/12/2023.
//

@testable import WeatherApp

final class WeatherAssemblerMock: Assembler {
    static let shareInstance = WeatherAssemblerMock()
    
    private let weatherRepositoryMock: WeatherRepositoryDataSourceMock
    private let weatherPresentationMock: WeatherPresentationLogicMock
    
    init() {
        weatherRepositoryMock = WeatherRepositoryDataSourceMock()
        weatherPresentationMock = WeatherPresentationLogicMock()
    }
    
    func assemble() {
        let container = DIContainer.shared
        container.register(weatherRepositoryMock)
        container.register(weatherPresentationMock)
    }
}
