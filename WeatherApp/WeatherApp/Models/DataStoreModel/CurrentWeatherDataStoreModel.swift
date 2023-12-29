//
//  CurrentWeatherDataStoreModel.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation

struct CurrentWeatherDataStoreModel: Hashable, Codable {
    let zoneName : String?
    let temperature : Float?
    let condition: String?
    let wind : Float?
    let preciption: Float?
    let humidity: Int?
    let cloud : Int?
    let feelslike: Float?
    let uv : Float?
    
    init(_ currentWeatherModel: CurrentWeatherResponse){
        self.zoneName = currentWeatherModel.location?.tz_id
        self.temperature = currentWeatherModel.current?.temp_c
        self.condition = currentWeatherModel.current?.condition?.text
        self.wind = currentWeatherModel.current?.wind_mph
        self.preciption = currentWeatherModel.current?.precip_mm
        self.humidity = currentWeatherModel.current?.humidity
        self.cloud = currentWeatherModel.current?.cloud
        self.feelslike = currentWeatherModel.current?.feelslike_c
        self.uv = currentWeatherModel.current?.uv
       }
   
}


