//
//  UIImage.swift
//  CloudyAPP
//
//  Created by febi on 10/24/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func ImageForIcon(withName name: String) -> UIImage {
        switch name {
        case Asset.clearDay.name:
            return Asset.clearDay.image
        case Asset.clearNight.name:
            return Asset.clearNight.image
        case Asset.rain.name:
            return Asset.rain.image
        case Asset.snow.name:
            return Asset.snow.image
        case Asset.sleet.name:
            return Asset.sleet.image
        case Asset.cloudy.name:
            return Asset.cloudy.image
        default:
            return Asset.cloudy.image
        }
    }
    
}
