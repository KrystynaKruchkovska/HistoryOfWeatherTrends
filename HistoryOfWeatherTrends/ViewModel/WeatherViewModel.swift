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
        self.downloadData(withURL:URL_CONSTANTS.BASE_URL) { (data, error) in
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
    
    func convertDataArrayToWeatherModel(data:[String]) -> WeatherModel{
        
        guard let year = Int(data[0]) else {
            fatalError()
        }
        guard let month = Int(data[1]) else {
            fatalError()
        }
        guard let maxTemperature = Double(data[2]) else {
            fatalError()
        }
        guard let minTemperature = Double(data[3]) else {
            fatalError()
        }
        guard let daysOfairFrost = Int(data[4]) else {
            fatalError()
        }
        guard let mmOfRainfall = Double(data[5]) else {
            fatalError()
        }
        guard let hoursOfSunshine = Double(data[6]) else {
            fatalError()
        }
        
        return WeatherModel(year: year, month: month, maxTemperature: maxTemperature, minTemperature: minTemperature, daysOfAirFrost: daysOfairFrost, mmOfRainfall: mmOfRainfall, hoursOfSunshine: hoursOfSunshine)
        
    }
    
    
}
