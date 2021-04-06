//
//  Int+Extensions.swift
//  MyOpenWeather
//
//  Created by Tran on 2/11/21.
//

import Foundation

public extension Int {
    //transform degree number to compass-human reading format
    func degreesToCompass() -> String {
        let compass = ["N","NNE","NE","ENE","E","ESE","SE","SSE","S","SSO","SO","OSO","O","ONO","NO","NNO"]
        let index = Int((Double(self) / 22.5) + 0.5) % 16
        return compass[index]
    }
}
