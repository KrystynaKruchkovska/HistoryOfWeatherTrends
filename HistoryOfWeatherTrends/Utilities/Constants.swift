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
    
    static let stations = [
        Station(url:"https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/bradforddata.txt", name:"Bradford"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/aberporthdata.txt", name: "Aberporth"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/armaghdata.txt", name: "Armagh"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/ballypatrickdata.txt", name: "Ballypatrick Forest"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/braemardata.txt", name: "Braemar"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/cambornedata.txt", name: "Camborne"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/cambridgedata.txt", name: "Cambridge NIAB"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/cardiffdata.txt", name: "Cardiff Bute Park"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/chivenordata.txt", name: "Chivenor"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/cwmystwythdata.txt", name: "Cwmystwyth"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/dunstaffnagedata.txt", name: "Dunstaffnage"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/durhamdata.txt", name: "Durham"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/eastbournedata.txt", name: " Eastbourne"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/eskdalemuirdata.txt", name: "Eskdalemuir"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/heathrowdata.txt", name: "Heathrow"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/hurndata.txt", name: "Hurn"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/lerwickdata.txt", name: "Lerwick"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/leucharsdata.txt", name: "Leuchars"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/lowestoftdata.txt", name: "Lowestoft"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/manstondata.txt", name: "Manston"),
        Station(url: "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/nairndata.txt", name: "Nairn")]
    
    static let valueNotAvailable = "Not available"
}



