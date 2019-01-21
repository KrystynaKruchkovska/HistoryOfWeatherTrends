//
//  WeatherServiceProtocol.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/21/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation

protocol WeatherServiceProtocol {
     func downloadData(withURL url: String, withCompletion completion: @escaping (_ data:String?,_ error:Error?) -> Void)
}
