//
//  WeatherUIView.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import SwiftUI
import Combine

protocol CurrentWeatherDisplayLogic {
    func displayCategories(viewModel: CurrentWeatherModel.Fetch.ViewModel)
}
struct WeatherUIView: View {
    var interactor: CurrentWeatherBusinessLogic?
    @ObservedObject var currentWeatherViewModel: CurrentWeatherModel.Fetch.ViewModel
    @State private var locationCancellable = Set<AnyCancellable>()
    var body: some View {
      
            ZStack {
                BackgroundUIView()
                VStack{
                    HeaderUIView(Title: currentWeatherViewModel.currentWeatherDataStoreModel?.zoneName ?? "")
                    Spacer()
                    CurrentWeatherUIView(currentWeatherViewModel: currentWeatherViewModel)
                        .padding([.leading, .trailing])
                    Spacer()
                }
            }
            .colorScheme(.dark)
            .onAppear{
                fetchCurrentWeather()
            }
        }
}

extension WeatherUIView: CurrentWeatherDisplayLogic{
    func displayCategories(viewModel: CurrentWeatherModel.Fetch.ViewModel) {
        DispatchQueue.main.async {
            self.currentWeatherViewModel.currentWeatherDataStoreModel = viewModel.currentWeatherDataStoreModel
        }
    }
    
    func fetchCurrentWeather() {
    LocationManager.LocationSharedInstance.requestAccessingLocation()
    LocationManager.LocationSharedInstance.$countryCode.sink(receiveValue: { countryCode in
          if let countryCode = countryCode {
              let request = CurrentWeatherModel.Fetch.Request(countryCode: countryCode)
              interactor?.loadCurrentWeather(request: request)
          }
        }).store(in: &locationCancellable)
        
    }
    
}
