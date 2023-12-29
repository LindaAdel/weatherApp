//
//  CurrentWeatherInteractor.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
import Combine

protocol CurrentWeatherBusinessLogic {
    func loadCurrentWeather(request: CurrentWeatherModel.Fetch.Request)
}

class CurrentWeatherInteractor {
    @Inject var CurrentWeatherRepository: CurrentWeatherRepositoryDataSource
    var presenter : CurrentWeatherPresentationLogic?
    private var cancellables = Set<AnyCancellable>()
    
}

extension CurrentWeatherInteractor: CurrentWeatherBusinessLogic {
    
    func loadCurrentWeather(request: CurrentWeatherModel.Fetch.Request) {
        CurrentWeatherRepository.getCurrentWeather(countryCode: request.countryCode)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                // Handle error
                print("error-interactor-\(error)")
            }
        }, receiveValue: { [weak self] currentWeatherResponse in
            // Process Weather Response
            let response = CurrentWeatherModel.Fetch.Response(currentWeatherModel: currentWeatherResponse)
            self?.presenter?.presentCurrentWeather(response: response)
        })
        .store(in: &cancellables)
    }

    
    
}
