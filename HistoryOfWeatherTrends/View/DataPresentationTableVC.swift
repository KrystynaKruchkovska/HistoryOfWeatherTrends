//
//  DataPresentationTableVC.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/19/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class DataPresentationTableVC: UITableViewController {
    
    var weatherViewModel:WeatherViewModel!
    var selectedElement:String!
    
    @IBOutlet weak var valueType: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.valueType.title = selectedElement
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherViewModel.weatherDataPoints.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherDataPoint = self.weatherViewModel.weatherDataPoints[indexPath.row]
        
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: CONSTANTS.CELL_IDENTIFIRES.dataPresentCell, for: indexPath) as? DataPresentTableViewCell else {
            fatalError()
        }
        
        let value = getPointValue(weatherDataPoint: weatherDataPoint)
        
        cell.setupCell(year: self.valueOrNotAvailable(weatherDataPoint.yyyy),
                       month: self.valueOrNotAvailable(weatherDataPoint.mm),
                       value: self.valueOrNotAvailable(value))
        
        return cell
    }
    
    private func getPointValue(weatherDataPoint:WeatherDataPoint) -> Double? {
        
        var result:Double?
        switch selectedElement{
            
        case "Maximum temperature":
            result =  weatherDataPoint.tmax
        case "Minimum temperature":
            result =  weatherDataPoint.tmin
        case "Days of air frost":
            if let af = weatherDataPoint.af {
                result =  Double(af)
            }else{
                result =  nil
            }
        case "Amount of rain fall":
            result = weatherDataPoint.rain
        case "Hours of sunshine":
           result =   weatherDataPoint.sun
        default:
            print("() is outside of the box")
        }
        
        return result
    }
    
    private func valueOrNotAvailable<T>(_ value:T?) -> String {
        if let value = value {
            return String(describing: value)
        }
        
        return CONSTANTS.valueNotAvailable
    }
}
