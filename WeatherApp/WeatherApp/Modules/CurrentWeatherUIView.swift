//
//  CurrentWeatherUIView.swift
//  WeatherApp
//
//  Created by Linda adel on 29/12/2023.
//

import SwiftUI

struct CurrentWeatherUIView: View {
    @ObservedObject var currentWeatherViewModel: CurrentWeatherModel.Fetch.ViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text(currentWeatherViewModel.currentWeatherDataStoreModel?.condition ?? "")
                    .font(.title)
                    .fontWeight(.light)
                    .padding(.bottom)
            
            HStack {
                Text(currentWeatherViewModel.currentWeatherDataStoreModel?.temperature?.description.split(separator: ".").first ?? "")
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
                        Text(currentWeatherViewModel.currentWeatherDataStoreModel?.feelslike?.description ?? "")
                        }.padding(.bottom, 1)
                    
                    HStack {
                        Text("WIND SPEED")
                        Spacer()
                        Text(currentWeatherViewModel.currentWeatherDataStoreModel?.wind?.description ?? "")
                        }.padding(.bottom, 1)
                    
                    HStack {
                        Text("HUMIDITY")
                        Spacer()
                        Text(currentWeatherViewModel.currentWeatherDataStoreModel?.humidity?.description ?? "")
                        }.padding(.bottom, 1)
                    
                    HStack {
                        Text("PRECIPITATION")
                        Spacer()
                        Text(currentWeatherViewModel.currentWeatherDataStoreModel?.preciption?.description ?? "")
                        }.padding(.bottom, 1)
                    
                    HStack {
                        Text("UV INDEX")
                        Spacer()
                        Text(currentWeatherViewModel.currentWeatherDataStoreModel?.uv?.description ?? "")
                        }.padding(.bottom, 1)
                    }.font(.caption)
                }
        }
    }
}

