//
//  LocationsViewLocationViewModel.swift
//  CloudyAPP
//
//  Created by febi on 10/24/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import UIKit
import CoreLocation

struct LocationsViewLocationViewModel {
    
    let location: CLLocation?
    let locationAsString: String?
    
    init(location:CLLocation? = nil, locationAsString: String? = nil) {
        self.location = location
        self.locationAsString = locationAsString
    }
}

extension LocationsViewLocationViewModel: LocationRepresentable{
    var text: String{
        if let locationAsString = locationAsString{
            return locationAsString
        } else if let location = location {
            return location.asString
        }
        
        return "Unknown Location"
    }
}

extension CLLocation {
    
    var asString: String {
        let latitude = String(format: "%.3f", coordinate.latitude)
        let longitude = String(format: "%.3f", coordinate.longitude)
        return "\(latitude), \(longitude)"
    }
    
}


