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
    let icon: String?
    let wind : Float?
    let preciption: Float?
    let humidity: Int?
    let cloud : Int?
    let feelslike: Float?
    let uv : Float?
    
    init(_ weatherResponse: WeatherResponse){
        self.zoneName = weatherResponse.location?.tz_id
        self.icon = weatherResponse.current?.condition?.icon
        self.temperature = weatherResponse.current?.temp_c
        self.condition = weatherResponse.current?.condition?.text
        self.wind = weatherResponse.current?.wind_mph
        self.preciption = weatherResponse.current?.precip_mm
        self.humidity = weatherResponse.current?.humidity
        self.cloud = weatherResponse.current?.cloud
        self.feelslike = weatherResponse.current?.feelslike_c
        self.uv = weatherResponse.current?.uv
       }
   
}


