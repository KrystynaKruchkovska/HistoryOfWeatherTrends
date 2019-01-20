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
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            Alamofire.request(url, method: .get).responseData(queue: DispatchQueue.global(qos: .userInitiated)
                , completionHandler: { (response) in
                    
                    if let error = response.result.error {
                        completion(nil, error)
                        return
                    }
                    
                    guard let data = response.data else {
                        // completion handler with error
                        // create our own error
                        completion( nil, errSecInternalError as? Error)
                        return
                    }
                    
                    guard let textData = String(data: data, encoding: String.Encoding.utf8) else {
                        return
                    }
                  
                        Thread.sleep(forTimeInterval: 3)
                    
                    
                    completion(textData,nil)
            })
            
        }
        
        
    }
    
}
