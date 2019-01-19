//
//  Constants.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/16/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation

struct CONSTANTS {
    struct URL {
        static let base_url = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/bradforddata.txt"
    }
    
    static let stations = [Station(url:"https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/bradforddata.txt", name:"Meteorological station Bradford")]
    
    struct CELL_IDENTIFIRES {
        static let stationCell = "stationCell"
    }
    struct SEGUE {
        static let toMenuStation = "toMenuTableVC"
    }
    
    
    static let menuSelections = [ "maxTemperature", "minTemperature", "daysOfAirFrost","mmOfRainfall", "hoursOfSunshine"]
    
}



