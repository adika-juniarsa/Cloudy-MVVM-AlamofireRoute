//
//  Configuration.swift
//  CloudyAPP
//
//  Created by febi on 10/22/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import Foundation


struct Defaults {
    static let latitude: Double = -6.914744
    static let longitude: Double = 107.609810
}

struct API {
    static let APIkey = "8fe5770fb357eeaf036b7ac43c018fd0"
    static let BaseURL = URL(string: "https://api.darksky.net/forecast/")!
    
    static var AuthenticatedBaseURL: URL {
        return BaseURL.appendingPathComponent(APIkey)
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
