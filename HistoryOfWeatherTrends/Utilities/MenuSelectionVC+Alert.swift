//
//  MenuSelectionVC+Alert.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/21/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation
import UIKit

extension MenuSelectionVC {
    
    func showAlertWithMessage(_ error:Error?,  handler:((_
        action:UIAlertAction?)->())?){
        
        guard  let error  = error?.localizedDescription else {
            return
        }
        
        let alert = UIAlertController(title: "Oops", message: error, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:handler))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
