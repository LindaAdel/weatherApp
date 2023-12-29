//
//  CurrentWeatherPresenter.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
protocol CurrentWeatherPresentationLogic {
    func presentCurrentWeather(response: CurrentWeatherModel.Fetch.Response)
}

class CurrentWeatherPresenter {
    var view: CurrentWeatherDisplayLogic?
}

extension CurrentWeatherPresenter: CurrentWeatherPresentationLogic {
    func presentCurrentWeather(response: CurrentWeatherModel.Fetch.Response) {
        let viewModel = CurrentWeatherModel.Fetch.ViewModel()
        viewModel.currentWeatherDataStoreModel = CurrentWeatherDataStoreModel(response.currentWeatherModel)
        view?.displayCategories(viewModel: viewModel)
    }
    
    
}
