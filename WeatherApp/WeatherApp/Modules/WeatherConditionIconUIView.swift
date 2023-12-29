//
//  WeatherConditionIconUIView.swift
//  WeatherApp
//
//  Created by Linda adel on 29/12/2023.
//

import SwiftUI

struct WeatherConditionIconUIView: View {
    let width: CGFloat
    let height: CGFloat
    let imageURL: String
    var body: some View {
        AsyncImage(url: URL(string: "https:\(imageURL)")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        } placeholder: {
            Color.clear
        }
        .frame(width: width, height: height)
    }
}

