//
//  CurrentWeatherRepository.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
import Combine

protocol CurrentWeatherRepositoryDataSource {
    func getCurrentWeather(countryCode: String) -> AnyPublisher<CurrentWeatherResponse, APIError>
}

class CurrentWeatherRepository : CurrentWeatherRepositoryDataSource {
    
   private let remoteDataSource: CurrentWeatherRemoteDataSource
    
    init(remoteDataSource: CurrentWeatherRemoteDataSource){
        self.remoteDataSource = remoteDataSource
    }
    
    func getCurrentWeather(countryCode: String) -> AnyPublisher<CurrentWeatherResponse, APIError> {
        return remoteDataSource.getCurrentWeather(countryCode: countryCode).eraseToAnyPublisher()
    }
   
    
}
