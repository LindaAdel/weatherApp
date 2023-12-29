//
//  NetworkConstants.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
struct NetworkConstants{
    struct constants{
        static let apiKey  = AppConfiguration.apiKey
        static let forecastDays = 5
    }
    
    struct ContentType {
        static let json = "application/json"
    }
    
    struct path {
        static let weather = "forecast.json"
    }
    
}
