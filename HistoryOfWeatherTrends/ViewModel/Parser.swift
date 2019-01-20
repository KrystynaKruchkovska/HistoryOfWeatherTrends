//
//  Parser.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/16/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation


class Parser {
    
    class func parse(textData: String) -> [[String]] {
        // Splitting raw string in to array by "\r\n"
        let splittedTextData = textData.split(separator: "\r\n")
        // Defining startIndex where data is started
        var startIndex = 0
        
        if let index = splittedTextData.index(of: "              degC    degC    days      mm   hours") {
            startIndex  = index + 1
        }
        
        // Creating of monthly data arrays in needed range
        var rawMonthlyDataArrays = splittedTextData[startIndex..<splittedTextData.count].map { $0.split(separator: " ") }
    
        // Removing unnecessery "Provisional" element from some arrays
        rawMonthlyDataArrays = rawMonthlyDataArrays.compactMap { $0.filter { $0 != "Provisional" } }
        rawMonthlyDataArrays = rawMonthlyDataArrays.compactMap { $0.filter { $0 != "Site" } }
        rawMonthlyDataArrays = rawMonthlyDataArrays.compactMap { $0.filter { $0 != "closed" } }

        // Clearing elements of array by deleting "*" and "#" characters existing in some elements
        var clearMonthlyDataArrays = rawMonthlyDataArrays.map { $0.map { $0.replacingOccurrences(of: "*", with: "") } }
        
        clearMonthlyDataArrays = clearMonthlyDataArrays.map { $0.map { $0.replacingOccurrences(of: "#", with: "") } }
        
        clearMonthlyDataArrays = clearMonthlyDataArrays.map { $0.map { $0.replacingOccurrences(of: "---", with: "") } }
        
        clearMonthlyDataArrays = clearMonthlyDataArrays.filter { $0 != [] }
        
        return clearMonthlyDataArrays
    }
    
}

