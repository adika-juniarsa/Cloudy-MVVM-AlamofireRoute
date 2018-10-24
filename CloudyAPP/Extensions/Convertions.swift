//
//  Convertions.swift
//  CloudyAPP
//
//  Created by febi on 10/23/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import Foundation

extension Double {
    
    func toCelcius() -> Double {
        return ((self - 32.0) / 1.8)
    }
    
    func toKPH() -> Double {
        return (self * 1.609344)
    }
    
}
