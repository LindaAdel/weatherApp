//
//  HeaderUIView.swift
//  WeatherApp
//
//  Created by Linda adel on 29/12/2023.
//

import SwiftUI

struct HeaderUIView: View {
    let Title: String
    let currentDate: String = DateManager.DateManagerSharedInstance.getCurrentDate()
    var body: some View {
        VStack {
            Text(Title)
                .font(.title)
                .fontWeight(.light)
            Text(currentDate)
                .foregroundColor(.gray)
        }
    }
}
