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
            
            DispatchQueue.main.async {
                completion(parsedTextData,nil)
            }
            
        } catch let error as NSError {
            completion(nil,error)
        }
    }
    
    func getData( withCompletion completion: @escaping (_ data:[[String]]?,_ error:Error?) -> Void) {
        self.downloadData(withURL:CONSTANTS.URL.base_url) { (data, error) in
            if let error = error{
                completion(nil,error)
                return
            }
            
            if let data = data {
                self.parseData(textData: data, withCompletion: { (dataarray, error) in
                    if let error = error {
                        print (error)
                        return
                    }
                    if let dataArray = dataarray {
                        completion(dataArray,nil)
                    
                    }
                })
            }
        }
    }

    
    func convertDataArrayToWeatherDataPoint(dataLine:[String]) -> WeatherDataPoint {
        let year = (Int(dataLine[0]))
        let month = (Int(dataLine[1]))
        let maxTemperature = Double(dataLine[2])
        let minTemperature = Double(dataLine[3])
        let daysOfAirFrost = Int(dataLine[4])
        let mmOfRainfall = Double(dataLine[5])
        let hoursOfSunshine = Double(dataLine[6])
        
        return  WeatherDataPoint(year: year!, month: month!, maxTemperature: maxTemperature, minTemperature: minTemperature, daysOfAirFrost: daysOfAirFrost, mmOfRainfall: mmOfRainfall, hoursOfSunshine: hoursOfSunshine)
    }
    
    
}
