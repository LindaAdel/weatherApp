//
//  CurrentWeatherConfigurator.swift
//  WeatherApp
//
//  Created by Linda adel on 29/12/2023.
//

import SwiftUI

extension WeatherUIView {
    
    func configureView() -> some View {
      var view = self
      CurrentWeatherInteractorAssembler.shareInstance.assemble()
      let interactor = CurrentWeatherInteractor()
      let presenter = CurrentWeatherPresenter()
      view.interactor = interactor
      interactor.presenter = presenter
      presenter.view = view

      return view
    }
    
}
