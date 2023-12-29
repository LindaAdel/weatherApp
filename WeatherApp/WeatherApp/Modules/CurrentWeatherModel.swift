//
//  CurrentWeatherModel.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation

enum CurrentWeatherModel {
    enum Fetch {
        struct Request {
            var countryCode: String
        }
        struct Response {
            var currentWeatherModel: CurrentWeatherResponse
        }
        class ViewModel: ObservableObject {
            @Published var currentWeatherDataStoreModel: CurrentWeatherDataStoreModel?
        }
    }
}
