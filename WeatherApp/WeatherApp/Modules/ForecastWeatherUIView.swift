//
//  ForecastWeatherUIView.swift
//  WeatherApp
//
//  Created by Linda adel on 29/12/2023.
//

import SwiftUI

struct ForecastWeatherUIView: View {
    @ObservedObject var weatherViewModel: WeatherModel.Fetch.ViewModel
    var body: some View {
        VStack {
                   HStack {
                       Text("5-Day Forecast")
                           .foregroundColor(.gray)
                       
                       Spacer()
                       }.padding(.leading)
                   
                   Divider()
                       .padding([.leading, .trailing])
                   
            ForEach(weatherViewModel.WeatherForecastDataStoreModel ?? [] , id: \.date) { forecastDayInformation in
                       ZStack {
                           HStack {
                               if let date = forecastDayInformation.date {
                                   let day = DateManager.DateManagerSharedInstance.getWeekDay(from: date)
                                   Text(day)
                               }else {
                                   Text("Day")
                               }
                               Spacer()
                               Text(forecastDayInformation.day?.maxtemp_c?.description.split(separator: ".").first ?? "")
                               Text("°C")
                                   .padding(.trailing)
                               Text(forecastDayInformation.day?.mintemp_c?.description.split(separator: ".").first ?? "")
                                   .foregroundColor(.gray)
                                   .padding(.leading)
                               Text("°C")
                           }.padding([.leading,.trailing])
                           
                           if let iconURL = forecastDayInformation.day?.condition?.icon {
                               WeatherConditionIconUIView(width: 25, height: 25, imageURL: iconURL)
                           }
                           
                       }
                   }
               }
    }
}

