//
//  WeatherService.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/16/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService {
    
    func downloadData(withURL url: String, withCompletion completion: @escaping (_ data:String?,_ error:Error?) -> Void) {
        
            Alamofire.request(url, method: .get).responseData(queue: DispatchQueue.global(qos: .utility)
                , completionHandler: { (response) in
                    
                    if let error = response.result.error {
                        completion(nil, error)
                        return
                    }
                    
                    guard let data = response.data else {
                        completion(nil, createInternalError())
                        return
                    }
                    
                    guard let textData = String(data: data, encoding: String.Encoding.utf8) else {
                        return
                    }
                  
                    completion(textData,nil)
            })
       
    }
    
}
