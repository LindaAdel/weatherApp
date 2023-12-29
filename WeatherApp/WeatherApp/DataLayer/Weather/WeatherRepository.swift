//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
import Combine

protocol WeatherRepositoryDataSource {
    func getWeatherInformation(countryCode: String) -> AnyPublisher<WeatherResponse, APIError>
}

class WeatherRepository : WeatherRepositoryDataSource {
    
   private let remoteDataSource: WeatherRemoteDataSource
    
    init(remoteDataSource: WeatherRemoteDataSource){
        self.remoteDataSource = remoteDataSource
    }
    
    func getWeatherInformation(countryCode: String) -> AnyPublisher<WeatherResponse, APIError> {
        return remoteDataSource.getWeatherInformation(countryCode: countryCode).eraseToAnyPublisher()
    }
   
    
}
