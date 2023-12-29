//
//  WeatherUIView.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import SwiftUI
import Combine

protocol WeatherDisplayLogic {
    func displayWeatherInformation(viewModel: WeatherModel.Fetch.ViewModel)
}
struct WeatherUIView: View {
    var interactor: WeatherBusinessLogic?
    @ObservedObject var weatherViewModel: WeatherModel.Fetch.ViewModel
    @State private var locationCancellable = Set<AnyCancellable>()
    var body: some View {
      
            ZStack {
                BackgroundUIView()
                VStack{
                    HeaderUIView(Title: weatherViewModel.currentWeatherDataStoreModel?.zoneName ?? "")
                    Spacer()
                    CurrentWeatherUIView(weatherViewModel: weatherViewModel)
                        .padding([.leading, .trailing])
                    Spacer()
                    ForecastWeatherUIView(weatherViewModel: weatherViewModel)
                }
            }
            .colorScheme(.dark)
            .onAppear{
                fetchCurrentWeather()
            }
        }
}

extension WeatherUIView: WeatherDisplayLogic{
    func displayWeatherInformation(viewModel: WeatherModel.Fetch.ViewModel) {
        DispatchQueue.main.async {
            self.weatherViewModel.currentWeatherDataStoreModel = viewModel.currentWeatherDataStoreModel
            self.weatherViewModel.WeatherForecastDataStoreModel = viewModel.WeatherForecastDataStoreModel
        }
    }
    
    func fetchCurrentWeather() {
    LocationManager.LocationSharedInstance.requestAccessingLocation()
    LocationManager.LocationSharedInstance.$countryCode.sink(receiveValue: { countryCode in
          if let countryCode = countryCode {
              let request = WeatherModel.Fetch.Request(countryCode: countryCode)
              interactor?.loadWeather(request: request)
          }
        }).store(in: &locationCancellable)
        
    }
    
}
