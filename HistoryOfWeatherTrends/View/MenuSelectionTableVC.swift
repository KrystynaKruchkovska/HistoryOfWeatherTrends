//
//  MenuStationTableVC.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/19/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class MenuSelectionTableVC: UITableViewController {
    
    var weatherViewModel:WeatherViewModel!
    var currentStation:Station!
    var selectedElementtoPass:String!
    let menuSelections = CONSTANTS.menuSelections
    
    @IBOutlet weak var navigashionTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigashionTitle.title = self.currentStation.name
        
        self.weatherViewModel.getWeatherData(url:self.currentStation.url) { (error) in
            
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuSelections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CONSTANTS.CELL_IDENTIFIRES.stationCell, for: indexPath) as? DefaultTableViewCell else {
            fatalError()
        }
        
        let point = self.menuSelections[indexPath.row]
        cell.setupCell(stationNameLbl:point)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.selectedElementtoPass =  self.menuSelections[indexPath.row]
        return indexPath
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == CONSTANTS.SEGUES.toDataPresentationTableVC) {
            let vc = segue.destination as? DataPresentationTableVC
            vc?.weatherViewModel = self.weatherViewModel
            vc?.selectedElement = selectedElementtoPass
        }
    }
    
}
