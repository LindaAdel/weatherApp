//
//  CurrentWeatherResponse.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation

struct CurrentWeatherResponse: Codable {
    let location: LocationDataModel?
    let current: CurrentWeatherDataModel?
}
