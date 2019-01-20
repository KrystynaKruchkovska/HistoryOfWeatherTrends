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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func readWeatherPoints() {
    
        let indexInSelection = CONSTANTS.menuSelections.firstIndex(of: selectedElement)
        
        for dataPoint in self.weatherViewModel.weatherDataPoints {
            if indexInSelection == 0 {
                guard let value = dataPoint.tmax else {
                    continue
                }
                
            }
        }
        
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
        
        cell.setupCell(year: weatherDataPoint.yyyy, month: weatherDataPoint.mm, value: weatherDataPoint.tmax)
        
        return cell
    }

}
