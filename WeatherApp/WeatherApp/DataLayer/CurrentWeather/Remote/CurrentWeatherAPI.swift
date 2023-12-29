//
//  CurrentWeatherAPI.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
import Combine

protocol CurrentWeatherRemoteDataSource {
    func getCurrentWeather(countryCode: String) -> AnyPublisher<CurrentWeatherResponse, APIError>
}

class CurrentWeatherAPI: BaseAPI, CurrentWeatherRemoteDataSource {
    
    func getCurrentWeather(countryCode: String) -> AnyPublisher<CurrentWeatherResponse, APIError> {
        return request(request: CurrentWeatherRouter.getCurrentWeather(countryCode: countryCode), responseType: CurrentWeatherResponse.self, showDefaultAlertError: true)
    }
    
}
