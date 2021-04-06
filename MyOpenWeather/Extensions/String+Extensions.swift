//
//  String+Extensions.swift
//  MyOpenWeather
//
//  Created by Tran on 2/11/21.
//

import Foundation

extension String {
    //return string with first letter capitalized
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
