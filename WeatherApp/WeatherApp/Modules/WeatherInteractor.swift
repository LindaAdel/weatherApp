//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
import Combine

protocol WeatherBusinessLogic {
    func loadWeather(request: WeatherModel.Fetch.Request)
}

class WeatherInteractor {
    @Inject var weatherRepository: WeatherRepositoryDataSource
    var presenter : WeatherPresentationLogic?
    private var cancellables = Set<AnyCancellable>()
    
}

extension WeatherInteractor: WeatherBusinessLogic {
    
    func loadWeather(request: WeatherModel.Fetch.Request) {
        weatherRepository.getWeatherInformation(countryCode: request.countryCode)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                // Handle error
            }
        }, receiveValue: { [weak self] weatherResponse in
            // Process Weather Response
            let response = WeatherModel.Fetch.Response(weatherModel: weatherResponse)
            self?.presenter?.presentWeatherInformation(response: response)
        })
        .store(in: &cancellables)
    }

    
    
}
