//
//  Date+Extensions.swift
//  MyOpenWeather
//
//  Created by Tran on 2/8/21.
//

import Foundation

extension Date {
    //get format like Mon, 20 Feb
    func getDateString(forTime time: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM"
        
        let result = Date(timeIntervalSince1970: time)

        return(dateFormatter.string(from: result))
    }
    
    //get format like Mon, 20 Feb, 05:24 PM
    func getDateTimeString(forTime time: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM, hh:mm a"
        
        let result = Date(timeIntervalSince1970: time)

        return(dateFormatter.string(from: result))
    }
    
    //get format like 7AM
    func getFullHourString(forTime time: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        
        let result = Date(timeIntervalSince1970: time)

        return(dateFormatter.string(from: result))
    }
    
    //get format like 7AM
    func getHourString(forTime time: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ha"
        
        let result = Date(timeIntervalSince1970: time)

        return(dateFormatter.string(from: result))
    }
}
