//
//  CurrentWeatherDataModelMock.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation

struct CurrentWeatherDataModelMock{
    let temp_c: Float = 1.1
    let is_day: Int = 1
    let condition : WeatherConditionDataModelMock = WeatherConditionDataModelMock()
    let wind_mph: Float = 1.1
    let precip_mm: Float = 1.1
    let humidity: Int = 1
    let cloud: Int = 1
    let feelslike_c: Float = 2
    let uv: Float = 21.0
}


