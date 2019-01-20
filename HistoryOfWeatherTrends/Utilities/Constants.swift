//
//  Constants.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/16/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation

struct CONSTANTS {
 
    struct CELL_IDENTIFIRES {
        static let stationCell = "stationCell"
        static let dataPresentCell = "dataPresentTableViewCell"
    }
    
    struct SEGUES {
        static let toMenuStation = "toMenuVC"
        static let toDataPresentationTableVC = "toDataPresentationTableVC"
    }
    
    static let menuSelections = [ "Maximum temperature", "Minimum temperature", "Days of air frost","Amount of rain fall", "Hours of sunshine"]
    
    static let stations = [Station(url:"https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/bradforddata.txt", name:"Meteorological station Bradford")]
    
    static let valueNotAvailable = "Not available"
}



