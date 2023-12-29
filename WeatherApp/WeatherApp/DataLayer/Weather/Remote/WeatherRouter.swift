//
//  WeatherRouter.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
import Alamofire

enum WeatherRouter: BaseRouter {
    case getWeatherInformation(countryCode: String)
    
    var method: HTTPMethod {
        switch self {
        case .getWeatherInformation:
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
        case .getWeatherInformation(let countryCode):
            return "\(NetworkConstants.path.weather)?q=\(countryCode)&days=\(NetworkConstants.constants.forecastDays)&key=\(NetworkConstants.constants.apiKey)"
        }
    }
    
    
    
}
