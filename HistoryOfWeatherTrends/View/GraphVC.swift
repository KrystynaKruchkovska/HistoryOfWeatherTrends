//
//  GraphVC.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/21/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import ScrollableGraphView

class GraphVC: UIViewController,ScrollableGraphViewDataSource {
    
    var weatherViewModel:WeatherViewModel!
    var selectedElement:String!
    var weatherValues:[Double]!
    var graphView:ScrollableGraphView!
    
    let linePlot = LinePlot(identifier: "darkLine")
    let dotPlot = DotPlot(identifier: "darkLineDot")
    let referenceLines = ReferenceLines()
    

    override func viewDidLoad() {
        self.graphView = ScrollableGraphView(frame: self.view.frame, dataSource: self)
        self.setUpValues()
        self.setUpGraphView()
        self.view.addSubview(graphView)
    }
    
    func setUpValues(){
        let weatherDataArray = weatherViewModel.weatherDataPoints
        let weatherValues = weatherDataArray.map {(element) -> Double? in
            return self.weatherViewModel.getPointValue(weatherDataPoint: element, selectedElement: self.selectedElement)
        }
    
        self.weatherValues = weatherValues.compactMap{ $0 }
    }

    func setupDotPlot(){
        self.dotPlot.dataPointSize = 2
        self.dotPlot.dataPointFillColor = UIColor.white
        
        self.dotPlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
    }
    
    func setUpLinePlot() {
        self.linePlot.lineWidth = 1
        self.linePlot.lineColor = UIColor(red: 119, green: 119, blue: 119, alpha: 1)
        self.linePlot.lineStyle = ScrollableGraphViewLineStyle.smooth
        self.linePlot.shouldFill = true
        self.linePlot.fillType = ScrollableGraphViewFillType.gradient
        self.linePlot.fillGradientType = ScrollableGraphViewGradientType.linear
        self.linePlot.fillGradientStartColor = UIColor(red: 85, green: 85, blue: 85, alpha: 1)
        self.linePlot.fillGradientEndColor = UIColor(red: 68, green: 68, blue: 68, alpha: 1)
        
        self.linePlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
    }
    
    func setUpReferace(){
        
        self.referenceLines.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        self.referenceLines.referenceLineColor = UIColor.white.withAlphaComponent(0.2)
        self.referenceLines.referenceLineLabelColor = UIColor.white
        
        self.referenceLines.positionType = .absolute
        // Reference lines will be shown at these values on the y-axis.
        self.referenceLines.absolutePositions = [10, 20, 25, 30]
        self.referenceLines.includeMinMax = false
        
        self.referenceLines.dataPointLabelColor = UIColor.white.withAlphaComponent(0.5)
    }
    
    
    func setUpGraphView() {
        self.setUpLinePlot()
        self.setupDotPlot()
        self.setUpReferace()
        
        self.graphView.backgroundFillColor = UIColor(red: 51, green: 51, blue: 51, alpha: 1)
        self.graphView.dataPointSpacing = 80
        
        self.graphView.shouldAnimateOnStartup = true
        self.graphView.shouldAdaptRange = true
        self.graphView.shouldRangeAlwaysStartAtZero = true
        
        self.graphView.addPlot(plot: self.dotPlot)
        self.graphView.addPlot(plot: self.linePlot)
        self.graphView.addReferenceLines(referenceLines: self.referenceLines)
    }
    
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        switch(plot.identifier) {
        case "darkLine":
            return weatherValues[pointIndex]
        case "darkLineDot":
            return weatherValues[pointIndex]
        default:
            return 0
        }
    }
    
    func label(atIndex pointIndex: Int) -> String {
         return "FEB \(pointIndex)"
    }
    
    func numberOfPoints() -> Int {
         return weatherValues.count
    }
    

    
    
    
//    func setupFirstChart() {
//
//        graphView.setScaleEnabled(true)
//        graphView.pinchZoomEnabled = true
//
//        let weatherDataArray = weatherViewModel.weatherDataPoints
//
//        let weatherValues = weatherDataArray.map {(element) -> Double? in
//            return self.weatherViewModel.getPointValue(weatherDataPoint: element, selectedElement: self.selectedElement)
//        }
//
//        var unwrapedWeatherValues = weatherValues.compactMap{ $0 }
//
//
//        let values = (0..<unwrapedWeatherValues.count).map { (i) -> ChartDataEntry in
//            let val = unwrapedWeatherValues[i]
//            return ChartDataEntry(x: Double(i), y: val)
//        }
//
//
//        let set1 = LineChartDataSet(values: values, label: "DataSet 1")
//        set1.mode = .cubicBezier
//             //my phone is dead one sec ok
//        self.graphView.data = LineChartData(dataSet: set1)
//    }
    
    
    
}

