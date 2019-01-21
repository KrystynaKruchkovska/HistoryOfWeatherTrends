//
//  GraphVC.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/21/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import Charts

class GraphVC: UIViewController {
    
    var weatherViewModel:WeatherViewModel!
    var weatherArray:[[String]] = []
    
    @IBOutlet weak var graphView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    func setupFirstChart() {
        let range = 20
        let count = 10
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(UInt32(range)) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        
        let set1 = LineChartDataSet(values: values, label: "DataSet 1")
        
        self.graphView.data =  LineChartData(dataSet: set1)
    }
    
    
    
}

