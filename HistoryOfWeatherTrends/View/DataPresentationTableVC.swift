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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        return UITableViewCell()
    }

}
