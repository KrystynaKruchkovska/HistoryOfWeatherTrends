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
    var selectedElement:String!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var graphView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupFirstChart()
        self.scrollView.delegate = self
        
    }
    
    func setupFirstChart() {
       
        graphView.setScaleEnabled(true)
        graphView.pinchZoomEnabled = true

        let weatherDataArray = weatherViewModel.weatherDataPoints
        
        let weatherValues = weatherDataArray.map {(element) -> Double? in
            return self.weatherViewModel.getPointValue(weatherDataPoint: element, selectedElement: self.selectedElement)
        }
        
        var unwrapedWeatherValues = weatherValues.compactMap{ $0 }
    

        let values = (0..<unwrapedWeatherValues.count).map { (i) -> ChartDataEntry in
            let val = unwrapedWeatherValues[i]
            return ChartDataEntry(x: Double(i), y: val)
        }
        

        let set1 = LineChartDataSet(values: values, label: "DataSet 1")
        set1.mode = .cubicBezier
             //my phone is dead one sec ok
        self.graphView.data = LineChartData(dataSet: set1)
    }
    
    
    
}

