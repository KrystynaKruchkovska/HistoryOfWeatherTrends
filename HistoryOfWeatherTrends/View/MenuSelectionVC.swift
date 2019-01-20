//
//  MenuStationTableVC.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/19/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class MenuSelectionVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var weatherViewModel:WeatherViewModel!
    var currentStation:Station!
    var selectedElementtoPass:String!
    var menuSelections:[String] = []
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var navigashionTitle: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.navigashionTitle.title = self.currentStation.name
        
        downloadData()
    }

    // MARK: - Table view data source
    
    func downloadData(){
        self.startSpinnerAndControlOff()
        self.weatherViewModel.getWeatherData(url:self.currentStation.url) { [weak self] (error) in
            self?.menuSelections = CONSTANTS.menuSelections
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.stopSpinnerAndControlOn()
            }
        }
    }
    
    func startSpinnerAndControlOff(){
        DispatchQueue.main.async {
            self.spinner.isHidden = false
            self.spinner.startAnimating()
            self.view.isUserInteractionEnabled = false
        }
    }
    
    func stopSpinnerAndControlOn(){
        DispatchQueue.main.async {
            self.spinner.isHidden = true
            self.spinner.stopAnimating()
            self.view.isUserInteractionEnabled = true
        }
    }

func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuSelections.count
    }
    
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CONSTANTS.CELL_IDENTIFIRES.stationCell, for: indexPath) as? DefaultTableViewCell else {
            fatalError()
        }
        
        let point = self.menuSelections[indexPath.row]
        cell.setupCell(stationNameLbl:point)
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.selectedElementtoPass =  self.menuSelections[indexPath.row]
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == CONSTANTS.SEGUES.toDataPresentationTableVC) {
            let vc = segue.destination as? DataPresentationTableVC
            vc?.weatherViewModel = self.weatherViewModel
            vc?.selectedElement = selectedElementtoPass
        }
    }
    
}
