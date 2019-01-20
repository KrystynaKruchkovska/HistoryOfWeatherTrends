//
//  DataPresentTableViewCell.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/20/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class DataPresentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var valueLbl: UILabel!
    @IBOutlet weak var monthLbl: UILabel!
    
    func setupCell(year:String, month:String, value:String) {
        self.yearLbl.text = year
        self.monthLbl.text = month
        self.valueLbl.text = value
    }
    
}
