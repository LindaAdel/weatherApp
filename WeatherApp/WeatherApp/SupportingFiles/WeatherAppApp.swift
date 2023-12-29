//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            configureView()
        }
    }
    
    func configureView() -> some View {
      var view = WeatherUIView(currentWeatherViewModel: CurrentWeatherModel.Fetch.ViewModel())
      CurrentWeatherInteractorAssembler.shareInstance.assemble()
      let interactor = CurrentWeatherInteractor()
      let presenter = CurrentWeatherPresenter()
      view.interactor = interactor
      interactor.presenter = presenter
      presenter.view = view

      return view
    }
}
