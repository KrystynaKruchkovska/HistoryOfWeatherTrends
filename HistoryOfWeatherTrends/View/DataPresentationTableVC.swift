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
    

    
    @IBOutlet weak var valueType: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.valueType.title = selectedElement
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherViewModel.weatherDataPoints.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //WEATHER INFO TYPE
        // WEATHER_DATA_TYPE IS ARRAY OF CELLS WITH ALL INFO
        let weatherDataPoint = self.weatherViewModel.weatherDataPoints[indexPath.row]
        
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: CONSTANTS.CELL_IDENTIFIRES.dataPresentCell, for: indexPath) as? DataPresentTableViewCell else {
            fatalError()
        }
        
        let value = self.weatherViewModel.getPointValue(weatherDataPoint: weatherDataPoint,selectedElement: self.selectedElement)
        
        cell.setupCell(year: self.valueOrNotAvailable(weatherDataPoint.yyyy),
                       month: self.valueOrNotAvailable(weatherDataPoint.mm),
                       value: self.valueOrNotAvailable(value))
        
        return cell
    }
    
    private func valueOrNotAvailable<T>(_ value:T?) -> String {
        if let value = value {
            return String(describing: value)
        }
        
        return CONSTANTS.valueNotAvailable
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == CONSTANTS.SEGUES.toGraphVC) {
            let vc = segue.destination as? GraphVC
            vc?.weatherViewModel = self.weatherViewModel
            vc?.selectedElement = self.selectedElement
            
            
        }
    }
}
