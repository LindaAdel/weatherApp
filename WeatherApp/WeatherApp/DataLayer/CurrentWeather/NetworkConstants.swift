//
//  NetworkConstants.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
struct NetworkConstants{
    static let apiKey  = AppConfiguration.apiKey
    
    struct ContentType {
        static let json = "application/json"
    }
    
    struct path {
        static let currentWeather = "current.json"
    }
    
}
