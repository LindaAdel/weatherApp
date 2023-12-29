//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
protocol WeatherPresentationLogic {
    func presentWeatherInformation(response: WeatherModel.Fetch.Response)
}

class WeatherPresenter {
    var view: WeatherDisplayLogic?
}

extension WeatherPresenter: WeatherPresentationLogic {
    func presentWeatherInformation(response: WeatherModel.Fetch.Response) {
        let viewModel = WeatherModel.Fetch.ViewModel()
        viewModel.currentWeatherDataStoreModel = CurrentWeatherDataStoreModel(response.weatherModel)
        viewModel.WeatherForecastDataStoreModel = response.weatherModel.forecast?.forecastday
        view?.displayWeatherInformation(viewModel: viewModel)
    }
    
    
}
