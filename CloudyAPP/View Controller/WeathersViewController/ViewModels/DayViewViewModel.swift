//
//  DayViewViewModel.swift
//  CloudyAPP
//
//  Created by febi on 10/24/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import Foundation
import UIKit

struct DayViewViewModel {
    let currently:Currently
    var stringDate:Date
    
    init(currently:Currently) {
        self.currently = currently
        self.stringDate = Date(timeIntervalSince1970: Double((currently.time)!))
    }
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM d"
        return dateFormatter.string(from: stringDate)
    }
    
    var time: String{
        let timeFormatter = DateFormatter()
        if UserDefaults.timeNotation() == .twelveHour {
            timeFormatter.dateFormat = "hh:mm a"
        } else {
            timeFormatter.dateFormat = "HH:mm"
        }
        return timeFormatter.string(from: stringDate)
    }
    
    var summary: String {
        return currently.summary!
    }
    
    var temperature: String {
        var temperature = Double((currently.temperature)!)
        if UserDefaults.temperatureNotation() != .fahrenheit {
            temperature = temperature.toCelcius()
            return String(format: "%1f °C", temperature)
        } else {
            return String(format: "%.1f °F", temperature)
        }
    }
    
    var windSpeed: String {
        var windSpeed = Double((currently.windSpeed)!)
        if UserDefaults.unitsNotation() != .imperial {
            windSpeed = windSpeed.toKPH()
            return String(format: "%.f KPH", windSpeed)
        } else {
            return String(format: "%.f MPH", windSpeed)
        }
    }
    
    var image: UIImage? {
        return UIImage.ImageForIcon(withName: currently.icon!)
    }
}
