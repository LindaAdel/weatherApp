//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation

enum WeatherModel {
    enum Fetch {
        struct Request {
            var countryCode: String
        }
        struct Response {
            var weatherModel: WeatherResponse
        }
        class ViewModel: ObservableObject {
            @Published var currentWeatherDataStoreModel: CurrentWeatherDataStoreModel?
            @Published var WeatherForecastDataStoreModel: [ForecastDayInformationDataModel]?
        }
    }
}
