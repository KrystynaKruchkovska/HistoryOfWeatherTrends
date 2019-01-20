//
//  StationCell.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/19/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {

    @IBOutlet weak var stationNameLbl: UILabel!
    
    func setupCell(stationNameLbl: String){
        self.stationNameLbl.text = stationNameLbl
    }

}
