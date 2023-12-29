//
//  WeatherResponseMock.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation

struct WeatherResponseMock {
    let locatio =  LocationDataModelMock()
    let current = CurrentWeatherDataModelMock()
    let forecast =  WeatherForecastDataModelMock()
}
