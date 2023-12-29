//
//  LocationDataModel.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
struct LocationDataModel: Codable {
    let name : String?
    let region: String?
    let country: String?
    let lat : Double?
    let lon : Double?
    let tz_id : String?
    let localtime_epoch: Int?
    let localtime: String?
}

