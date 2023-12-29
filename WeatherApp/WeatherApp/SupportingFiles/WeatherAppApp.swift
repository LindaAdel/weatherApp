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
      var view = WeatherUIView(weatherViewModel: WeatherModel.Fetch.ViewModel())
      WeatherInteractorAssembler.shareInstance.assemble()
      let interactor = WeatherInteractor()
      let presenter = WeatherPresenter()
      view.interactor = interactor
      interactor.presenter = presenter
      presenter.view = view

      return view
    }
}
