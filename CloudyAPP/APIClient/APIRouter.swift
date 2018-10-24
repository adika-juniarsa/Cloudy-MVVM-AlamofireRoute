//
//  APIRouter.swift
//  CloudyAPP
//
//  Created by febi on 10/23/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter :URLRequestConvertible {    
    case fetchWeather(latitude: Double, longitude: Double)
    
    //MARK: - HTTP Method
    private var method: HTTPMethod {
        switch self {
        case .fetchWeather:
            return .get
        }
    }
    
    //MARK: - Path
    private var path: String {
        switch self {
        case .fetchWeather(let latitude, let longitude):
            return "\(latitude),\(longitude)"
        }
    }
    
    //Mark: - Parameter
    private var parameters: Parameters? {
        switch self {
        case .fetchWeather:
            return nil
        }
    }
    
    //Mark: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try API.AuthenticatedBaseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        //Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        //Parametes
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }

}
