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
        return formatDate(date: currentDate, format: "EEEE, MMM d")
    }
    
    func getWeekDay(from date: String) -> String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let inputDate = inputDateFormatter.date(from: date) else {
            return ""
        }
        
        return formatDate(date: inputDate, format: "EEEE")
    }
    
}

   
  
