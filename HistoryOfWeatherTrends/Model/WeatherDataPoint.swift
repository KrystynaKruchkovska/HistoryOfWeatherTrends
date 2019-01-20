//
//  WeatherModel.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/16/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation

struct WeatherDataPoint {
    
    let yyyy: Int?
    let mm: Month?
    let tmax: Double?
    let tmin: Double?
    let af: Int?
    let rain: Double?
    let sun: Double?
    
    init(year: Int, month: Int, maxTemperature: Double?, minTemperature: Double?, daysOfAirFrost: Int?, mmOfRainfall: Double?, hoursOfSunshine: Double?) {
        
        self.yyyy = year
        self.mm = Month(rawValue: month)
        self.tmax = maxTemperature
        self.tmin = minTemperature
        self.af = daysOfAirFrost
        self.rain = mmOfRainfall
        self.sun = hoursOfSunshine
        
    }
}
