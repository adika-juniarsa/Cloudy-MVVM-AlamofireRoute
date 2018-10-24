//
//  WeekModelView.swift
//  CloudyAPP
//
//  Created by febi on 10/24/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import UIKit

struct WeekModelView {
    let data: Data
    var stringDate:Date
    
    init(data:Data) {
        self.data = data
        self.stringDate = Date(timeIntervalSince1970: Double((data.time)!))
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
    
    var windSpeed: String {
        var _windSpeed = Double(data.windSpeed!)
        if UserDefaults.unitsNotation() != .imperial {
            _windSpeed = _windSpeed.toKPH()
            return String(format: "%.f KPH", _windSpeed)
        } else {
            return String(format: "%.f MPH", _windSpeed)
        }
    }
    
    var temperature: String {
        var temperatureMin = Double(data.temperatureMin!)
        var temperatureMax = Double(data.temperatureMax!)
        
        if UserDefaults.temperatureNotation() != .fahrenheit {
            temperatureMin = temperatureMin.toCelcius()
            temperatureMax = temperatureMax.toCelcius()
        }
        
        let min = String(format: "%.0f°", temperatureMin)
        let max = String(format: "%.0f°", temperatureMax)
        
        return "\(min) - \(max)"
    }
    
    var image: UIImage? {
        return UIImage.ImageForIcon(withName: data.icon!)
    }
}
