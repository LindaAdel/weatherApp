//
//  CurrentWeatherRouter.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
import Alamofire

enum CurrentWeatherRouter: BaseRouter {
    case getCurrentWeather(countryCode: String)
    
    var method: HTTPMethod {
        switch self {
        case .getCurrentWeather:
            return .get
        }
        
    }
    var authorized: Bool {
        switch self {
        default:
            return true
        }
    }
    var path: String {
        switch self {
        case .getCurrentWeather(let countryCode):
            return "\(NetworkConstants.path.currentWeather)?q=\(countryCode)&key=\(NetworkConstants.apiKey)"
        }
    }
    
    
    
}
