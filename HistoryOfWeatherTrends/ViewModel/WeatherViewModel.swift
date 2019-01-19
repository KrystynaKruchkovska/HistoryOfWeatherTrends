//
//  WeatherViewModel.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/16/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation

class WeatherViewModel {
    
    var weatherDataPoint:[WeatherDataPoint] = []
    private let weatherService =  WeatherService()
    
    
    func downloadData(withURL url: String, withCompletion completion: @escaping (_ data:String?,_ error:Error?) -> Void) {
        self.weatherService.downloadData(withURL: url, withCompletion: completion)
    }
    
    func parseData(textData:String, withCompletion completion: @escaping (_ data:[[String]]?,_ error:Error?) -> Void){
        
        
        let parsedTextData = Parser.parse(textData: textData)
        
        DispatchQueue.main.async {
            completion(parsedTextData,nil)
        }
        
    }
    
    func getWeatherData(url:String, withCompletion completion: @escaping (_ error:Error?) -> Void) {
        self.downloadData(withURL:url) { (data, error) in
            
            if let error = error {
                completion(error)
                return
            }
            
            if let data = data {
                self.parseData(textData: data, withCompletion: { (dataarray, error) in
                    if let error = error {
                        completion(error)
                        return
                    }
                    
                    if let dataArray = dataarray {
                        self.weatherDataPoint = self.convertToWeatherDataPoints(dataArray: dataArray)
                        completion(nil)
                    } else {
                        completion(createInternalError())
                    }
                })
            } else {
                completion(createInternalError())
            }
        }
    }
    
    func convertToWeatherDataPoints(dataArray:[[String]]) -> [WeatherDataPoint] {
        return dataArray.map({ (element) -> WeatherDataPoint in
            return self.convertToWeatherDataPoint(dataLine: element)
        })
    }
    
    func convertToWeatherDataPoint(dataLine:[String]) -> WeatherDataPoint {
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
