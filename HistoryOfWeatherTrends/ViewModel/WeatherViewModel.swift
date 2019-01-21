//
//  WeatherViewModel.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/16/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation

class WeatherViewModel {
    
    private let parser = Parser()
    var weatherDataPoints:[WeatherDataPoint] = []
    private let weatherService:WeatherServiceProtocol
    
    init (weatherService: WeatherServiceProtocol){
        self.weatherService = weatherService
    }
    
    func getWeatherData(url:String, withCompletion completion: @escaping (_ error:Error?) -> Void) {
        self.downloadData(withURL:url) { [weak self] (data, error) in
            
            guard let unwrapedself = self else{
                return
            }
            
            if let error = error {
                completion(error)
                
                return
            }
            
            guard let data = data else {
                completion(createInternalError())
                return
            }
            
            let dataarray = unwrapedself.parseData(textData: data)
            
            unwrapedself.weatherDataPoints = unwrapedself.convertToWeatherDataPoints(dataArray: dataarray)
            completion(nil)
        }
    }
    
    private func downloadData(withURL url: String, withCompletion completion: @escaping (_ data:String?,_ error:Error?) -> Void) {
        self.weatherService.downloadData(withURL: url, withCompletion: completion)
    
    }
    
    private func parseData(textData:String) -> [[String]]{
        return parser.parse(textData: textData)
    }
    
    private func convertToWeatherDataPoints(dataArray:[[String]]) -> [WeatherDataPoint] {
        return dataArray.map({ (element) -> WeatherDataPoint in
            return self.convertToWeatherDataPoint(dataLine: element)
        })
    }
    
    private func convertToWeatherDataPoint(dataLine:[String]) -> WeatherDataPoint {
   
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
