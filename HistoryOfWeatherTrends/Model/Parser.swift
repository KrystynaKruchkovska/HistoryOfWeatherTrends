//
//  Parser.swift
//  HistoryOfWeatherTrends
//
//  Created by Mac on 1/16/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation


 class Parser {
    
     func parse(textData: String) -> [[String]] {
        // Splitting raw string in to array by "\r\n"
        let splittedTextData = textData.split(separator: "\r\n")
        // Defining startIndex where data is started
        var startIndex = 0
        
        if let index = splittedTextData.index(of: "              degC    degC    days      mm   hours") {
            startIndex  = index + 1
        }
        
        let rangeArray = createRawArrayRange(splittedTextData: splittedTextData, startIndex: startIndex)

        return clearArray(rawMonthlyDataArrays: rangeArray)
    }
    
    private func createRawArrayRange(splittedTextData:[Substring.SubSequence], startIndex:Int) -> [[Substring.SubSequence]]{
        
        var rawMonthlyDataArrays = splittedTextData[startIndex..<splittedTextData.count].map { $0.split(separator: " ") }
        
        // Removing unnecessery "Provisional" element from some arrays
        rawMonthlyDataArrays = rawMonthlyDataArrays.compactMap { $0.filter { $0 != "Provisional" } }
        rawMonthlyDataArrays = rawMonthlyDataArrays.compactMap { $0.filter { $0 != "Site" } }
        rawMonthlyDataArrays = rawMonthlyDataArrays.compactMap { $0.filter { $0 != "closed" } }
        return rawMonthlyDataArrays
    }
    
    
    private func clearArray(rawMonthlyDataArrays:[[Substring.SubSequence]]) -> [[String]]{
        
        var clearMonthlyDataArrays = rawMonthlyDataArrays.map { $0.map { $0.replacingOccurrences(of: "*", with: "") } }
        
        clearMonthlyDataArrays = clearMonthlyDataArrays.map { $0.map { $0.replacingOccurrences(of: "#", with: "") } }
        
        clearMonthlyDataArrays = clearMonthlyDataArrays.map { $0.map { $0.replacingOccurrences(of: "---", with: "") } }
        
        clearMonthlyDataArrays = clearMonthlyDataArrays.filter { $0 != [] }
        
        
        return clearMonthlyDataArrays
    }
    
}

