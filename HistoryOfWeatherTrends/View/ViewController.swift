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
        self.getData()

    }
    
    
    func getData(){
        self.weatherViewModel.downloadData(withURL:URL_CONSTANTS.BASE_URL) { (data, error) in
            if let error = error{
                print(error)
                return
            }
            
            if let data = data {
                self.weatherViewModel.parseData(textData: data, withCompletion: { (dataarray, error) in
                    if let error = error {
                        print (error)
                        return
                    }
                    if let dataArray = dataarray {
                        self.weatherArray = dataArray
                    }
                })
            }
        }
    }
    
    
}

