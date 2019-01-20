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
    @IBOutlet weak var mounthLbl: UILabel!
    
    func setupCell(year:Int?, month:Month?, value:Double?){
        guard let year = year else {
            return
        }
        guard let month = month else {
            return
        }
        guard let value = value else {
            return
        }
        
        self.yearLbl.text = String(year)
        self.mounthLbl.text = String(month.rawValue)
        self.valueLbl.text = String(value)
    }

}
