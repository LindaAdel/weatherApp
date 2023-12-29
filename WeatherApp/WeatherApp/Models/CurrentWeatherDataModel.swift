//
//  CurrentWeatherDataModel.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation

struct CurrentWeatherDataModel: Codable{
    let temp_c: Float?
    let is_day: Int?
    let condition : WeatherConditionDataModel?
    let wind_mph: Float?
    let precip_mm: Float?
    let humidity: Int?
    let cloud: Int?
    let feelslike_c: Float?
    let uv: Float?
}


