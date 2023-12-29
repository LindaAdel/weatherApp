//
//  ForecastDayInformationDataModel.swift
//  WeatherApp
//
//  Created by Linda adel on 29/12/2023.
//

import Foundation

struct ForecastDayInformationDataModel:Codable {
    
    let date: String?
    let day: WeatherDayDataModel?
}



