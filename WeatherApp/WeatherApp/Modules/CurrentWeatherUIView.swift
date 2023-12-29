//
//  CurrentWeatherUIView.swift
//  WeatherApp
//
//  Created by Linda adel on 29/12/2023.
//

import SwiftUI

struct CurrentWeatherUIView: View {
    @ObservedObject var weatherViewModel: WeatherModel.Fetch.ViewModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                if let iconURL = weatherViewModel.currentWeatherDataStoreModel?.icon {
                    WeatherConditionIconUIView(width: 50, height: 50, imageURL: iconURL)
                }
                
                Text(weatherViewModel.currentWeatherDataStoreModel?.condition ?? "")
                    .font(.title)
                    .fontWeight(.light)
            } .padding(.bottom)
            
            HStack {
                Text(weatherViewModel.currentWeatherDataStoreModel?.temperature?.description.split(separator: ".").first ?? "")
                    .font(.system(size: 80))
                    .fontWeight(.ultraLight)
                
                Text("°C")
                    .font(.system(size: 80))
                    .fontWeight(.ultraLight)
                    .padding(.trailing)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("FEELS LIKE")
                        Spacer()
                        Text(weatherViewModel.currentWeatherDataStoreModel?.feelslike?.description ?? "")
                    }.padding(.bottom, 1)
                    
                    HStack {
                        Text("WIND SPEED")
                        Spacer()
                        Text(weatherViewModel.currentWeatherDataStoreModel?.wind?.description ?? "")
                    }.padding(.bottom, 1)
                    
                    HStack {
                        Text("HUMIDITY")
                        Spacer()
                        Text(weatherViewModel.currentWeatherDataStoreModel?.humidity?.description ?? "")
                    }.padding(.bottom, 1)
                    
                    HStack {
                        Text("PRECIPITATION")
                        Spacer()
                        Text(weatherViewModel.currentWeatherDataStoreModel?.preciption?.description ?? "")
                    }.padding(.bottom, 1)
                    
                    HStack {
                        Text("UV INDEX")
                        Spacer()
                        Text(weatherViewModel.currentWeatherDataStoreModel?.uv?.description ?? "")
                    }.padding(.bottom, 1)
                }.font(.caption)
            }
        }
    }
}

