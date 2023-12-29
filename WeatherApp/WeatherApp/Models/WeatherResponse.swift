//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation

struct WeatherResponse: Codable {
    let location: LocationDataModel?
    let current: CurrentWeatherDataModel?
    let forecast : WeatherForecastDataModel?
}
