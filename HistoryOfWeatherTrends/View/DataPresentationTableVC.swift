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
        cell.setupCell(year: weatherDataPoint.yyyy, month: weatherDataPoint.mm, value: value)
        
        return cell
    }
    
    private func getPointValue(weatherDataPoint:WeatherDataPoint) -> Double? {
        
        if selectedElement == "Maximum temperature" {
            return weatherDataPoint.tmax!
        } else if selectedElement == "Minimum temperature" {
            return weatherDataPoint.tmin!
        }else if selectedElement == "Days of air frost"{
            return Double( weatherDataPoint.af!)
        }else if selectedElement == "Amount of rain fall"{
            return weatherDataPoint.rain!
        }else if selectedElement == "Hours of sunshine"{
            return weatherDataPoint.sun!
        }
        
        return nil
    }
    
    
    
}
