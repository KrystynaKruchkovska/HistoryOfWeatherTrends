//
//  Utils.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/19/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation

func createInternalError() -> Error {
    return NSError(domain:"", code:-1, userInfo:[ NSLocalizedDescriptionKey: "Internal error"])
}
