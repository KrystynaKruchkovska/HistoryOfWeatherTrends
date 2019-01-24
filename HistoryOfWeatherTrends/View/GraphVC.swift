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
    
    let linePlot = LinePlot(identifier: "darkLine")
    let dotPlot = DotPlot(identifier: "darkLineDot")
    let referenceLines = ReferenceLines()
    
    
    @IBOutlet weak var graphView: ScrollableGraphView!
    

    override func viewDidLoad() {
        self.graphView.dataSource = self
        self.setUpValues()
        self.setUpGraphView()
        self.view.addSubview(graphView)
    }
    
    func createRangeOfNumbersforY() -> [Double]{
        var minValue = Int(weatherValues.min()!)
        let maxValue = Int(weatherValues.max()!)
        
        var rangeOfNumbersforY:[Double] = []
        
        while minValue <= maxValue {
            rangeOfNumbersforY.append(Double(minValue))
            minValue += 2
        }
        
        return rangeOfNumbersforY
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
        self.linePlot.lineColor = UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)
        self.linePlot.lineStyle = ScrollableGraphViewLineStyle.smooth
        self.linePlot.shouldFill = true
        self.linePlot.fillType = ScrollableGraphViewFillType.gradient
        self.linePlot.fillGradientType = ScrollableGraphViewGradientType.linear
        self.linePlot.fillGradientStartColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        self.linePlot.fillGradientEndColor = UIColor(red: 68/255, green: 68/255, blue: 68/255, alpha: 1)
        
        self.linePlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic

    }
    
    func setUpReferace(){
        
        self.referenceLines.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        self.referenceLines.referenceLineColor = UIColor.white.withAlphaComponent(0.2)
        self.referenceLines.referenceLineLabelColor = UIColor.white
        
        self.referenceLines.positionType = .absolute
        // Reference lines will be shown at these values on the y-axis.
        self.referenceLines.absolutePositions = self.createRangeOfNumbersforY()
    
        
        self.referenceLines.dataPointLabelColor = UIColor.white.withAlphaComponent(0.5)
    }
    
    func setUpGraphView() {
        self.setUpLinePlot()
        self.setupDotPlot()
        self.setUpReferace()
        
        self.graphView.backgroundFillColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        self.graphView.dataPointSpacing = 80
        
        self.graphView.shouldAnimateOnStartup = true
        
        self.graphView.addPlot(plot: self.dotPlot)
        self.graphView.addPlot(plot: self.linePlot)
        self.graphView.addReferenceLines(referenceLines: self.referenceLines)
        self.graphView.rangeMax = self.weatherValues.max()!
        self.graphView.rangeMin = self.weatherValues.min()!
    }
    
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        return self.weatherValues[pointIndex]
    }
    
    func label(atIndex pointIndex: Int) -> String {
         return "FEB \(pointIndex)"
    }
    
    func numberOfPoints() -> Int {
         return self.weatherValues.count
    }
    

    
}

