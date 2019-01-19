//
//  MenuStationTableVC.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/19/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class MenuSelectionTableVC: UITableViewController {
    
    var currentStation:Station!
    let menuSelections = CONSTANTS.menuSelections
    
    @IBOutlet weak var navigashionTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigashionTitle.title = self.currentStation.name

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


}
