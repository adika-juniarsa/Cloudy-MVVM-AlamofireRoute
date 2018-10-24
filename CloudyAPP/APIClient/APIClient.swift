//
//  APIClient.swift
//  CloudyAPP
//
//  Created by febi on 10/23/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIClient {
    
    static func fetchWeather(latitude: Double, longitude: Double, success:@escaping (JSON)->Void){

        Alamofire.request(APIRouter.fetchWeather(latitude: latitude, longitude: longitude)).responseJSON { (responseObject) -> Void in
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            } else {
                // add message error here
            }
        }
    }
    
    
    
}
