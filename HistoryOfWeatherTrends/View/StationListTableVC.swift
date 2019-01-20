//
//  StationListTableVC.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/19/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class StationListTableVC: UITableViewController {
    var weatherViewModel = WeatherViewModel()
    var stationsArray:[Station] = CONSTANTS.stations
    var stationToPass:Station!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stationsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CONSTANTS.CELL_IDENTIFIRES.stationCell, for: indexPath) as? DefaultTableViewCell else {
            fatalError()
        }
        
        let station = self.stationsArray[indexPath.row]
        cell.setupCell(stationNameLbl:station.name)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.stationToPass =  self.stationsArray[indexPath.row]
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == CONSTANTS.SEGUES.toMenuStation) {
            let vc = segue.destination as? MenuSelectionVC
            vc?.currentStation = self.stationToPass
            vc?.weatherViewModel = self.weatherViewModel
            
        }
    }
  
}
