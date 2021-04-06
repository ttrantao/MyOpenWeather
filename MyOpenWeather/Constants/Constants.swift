//
//  Constants.swift
//  MyOpenWeather
//
//  Created by Tran on 3/11/21.
//

import Foundation

struct Constants {
    static let openWeatherMapAPIKey = "201a46186beba4d663f4f93b3e9de1da"
    static let openWeatherIconURL = "http://openweathermap.org/img/wn/"
    
    static let baseURL = "http://api.openweathermap.org"
    static let oneCallPath = "/data/2.5/onecall"
    
    //to remove hard coded latitude, longitude & city later when geoloc will be added
    static let oneCallQuery = "lat=48.85341&lon=2.3488&units=metric&appId=\(Constants.openWeatherMapAPIKey)"
    static let city = "Paris"
    
    static let currentWeatherCellId = "CurrentWeatherCellIdentifier"
    static let hourlyForecastCellId = "HourlyForecastCellIdentifier"
    static let hourForecastCellId = "HourForecastCellIdentifier"
    static let dailyForecastCellId = "DailyForecastCellIdentifier"

}
