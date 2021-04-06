//
//  DayDetailViewModel.swift
//  MyOpenWeather
//
//  Created by Tran on 3/12/21.
//

import Foundation

struct DayDetailViewModel {
    let clouds: Int?
    let deg: Int?
    let humidity: Int?
    let pressure: Int?
    let probOfPrecipitation: Double?
    let rain: Double?
    let snow: Double?
    let speed: Double?
    let time: Double
    let sunriseTime: Double
    let sunsetTime: Double
    let tempDay: Int
    let tempMin: Int
    let tempMax: Int
    let tempNight: Int
    let tempEve: Int
    let tempMorn: Int
    let feelsLikeDay: Int
    let feelsLikeEve: Int
    let feelsLikeMorn: Int
    let feelsLikeNight: Int
    let weatherInfoDesc: String
    let weatherInfoMain: String
    let weatherInfoIconIdString: String
}
