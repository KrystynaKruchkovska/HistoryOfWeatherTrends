//
//  WeatherViewModel.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/16/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation

class WeatherViewModel {
    private let weatherService =  WeatherService()
    
    func downloadData(withURL url: String, withCompletion completion: @escaping (_ data:String?,_ error:Error?) -> Void) {
        self.weatherService.downloadData(withURL: url, withCompletion: completion)
    }
    
    func parseData(textData:String, withCompletion completion: @escaping (_ data:[[String]]?,_ error:Error?) -> Void){
        
        do {
            let parsedTextData = try Parser.parse(textData: textData)
            // here we don't want do parsing, it should be moved to
            // WeatherViewModel and this handler's arguments should be just (string?, error?)
            
            DispatchQueue.main.async {
                completion(parsedTextData,nil)
            }
            
        } catch let error as NSError {
            print(error)
        }
    }
    
    
    
}
