//
//  WeatherForecastDataModel.swift
//  WeatherApp
//
//  Created by Linda adel on 29/12/2023.
//

import Foundation

struct WeatherForecastDataModel: Codable {
    let forecastday: [ForecastDayInformationDataModel]?
    
}

