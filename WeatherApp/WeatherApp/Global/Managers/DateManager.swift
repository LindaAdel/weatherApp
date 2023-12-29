//
//  DateManager.swift
//  WeatherApp
//
//  Created by Linda adel on 29/12/2023.
//

import Foundation
class DateManager {
    static let DateManagerSharedInstance = DateManager()
    private let dateFormatter: DateFormatter
    
   private init() {
        self.dateFormatter = DateFormatter()
        self.dateFormatter.timeZone = TimeZone.current
    }
    
    private func formatDate(date: Date, format: String) -> String {
        self.dateFormatter.dateFormat = format
        return self.dateFormatter.string(from: date)
    }
    
    func getCurrentDate() -> String {
        let currentDate = Date()
        return formatCurrentDate(date: currentDate)
    }
    
    private func formatCurrentDate(date: Date) -> String {
        self.dateFormatter.dateFormat = "EEEE, MMM d"
        return self.dateFormatter.string(from: date)
    }
}

   
  
