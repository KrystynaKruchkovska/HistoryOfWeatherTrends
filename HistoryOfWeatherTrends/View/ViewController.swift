//
//  ViewController.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/16/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var weatherViewModel = WeatherViewModel()
    var weatherArray:[[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherViewModel.getData { (dataArray,error) in
            if let data = dataArray {
                self.weatherArray = data
            }
        }
        
    }
    
    
    
    
    
}

