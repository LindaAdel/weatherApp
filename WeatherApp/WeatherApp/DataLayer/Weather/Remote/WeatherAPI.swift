//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
import Combine

protocol WeatherRemoteDataSource {
    func getWeatherInformation(countryCode: String) -> AnyPublisher<WeatherResponse, APIError>
}

class WeatherAPI: BaseAPI, WeatherRemoteDataSource {
    
    func getWeatherInformation(countryCode: String) -> AnyPublisher<WeatherResponse, APIError> {
        return request(request: WeatherRouter.getWeatherInformation(countryCode: countryCode), responseType: WeatherResponse.self, showDefaultAlertError: true)
    }
    
}
