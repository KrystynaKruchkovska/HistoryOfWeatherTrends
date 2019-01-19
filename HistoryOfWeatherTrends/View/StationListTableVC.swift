//
//  StationListTableVC.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/19/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class StationListTableVC: UITableViewController {
    
    var stationsArray:[Station] = CONSTANTS.stations
    
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CONSTANTS.CELL_IDENTIFIRES.stationCell, for: indexPath) as? StationCell else {
            fatalError()
        }
        
        let station = self.stationsArray[indexPath.row]
        cell.setupCell(stationNameLbl:station.name)
        
        return cell
    }
    
}
