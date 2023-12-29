//
//  WeatherDayDataModel.swift
//  WeatherApp
//
//  Created by Linda adel on 29/12/2023.
//

import Foundation

struct WeatherDayDataModel: Codable {
    let maxtemp_c: Float?
    let mintemp_c: Float?
    let condition: WeatherConditionDataModel?
}
