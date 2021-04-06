//
//  WeatherModel.swift
//  MyOpenWeather
//
//  Created by Tran on 3/11/21.
//

import Foundation

//MARK: -Weather Data
struct Weather: Codable {
    var lat, lon: Double
    var city: String
    var currentWeather: CurrentWeather
    var hourlyForecast: [HourlyForecast]
    var dailyForecast: [DailyForecast]
    
    enum CodingKeys: String, CodingKey {
        case lat
        case lon
        case city = "timezone"
        case currentWeather = "current"
        case hourlyForecast = "hourly"
        case dailyForecast = "daily"
    }
}

//MARK: -Weather Info Data
struct WeatherInfo: Codable {
    var description, main: String
    var icon: String
    var id: Int
}

//MARK: -Current Weather Data
struct CurrentWeather: Codable {
    var time: Double
    var sunrise, sunset: Double
    var temperature, feelsLike, dewPoint, windSpeed: Double
    var pressure, humidity, clouds, visibility, windDegree: Int
    var uvi: Double
    var weatherInfo: [WeatherInfo]
    
    enum CodingKeys: String, CodingKey {
        case time = "dt"
        case sunrise
        case sunset
        case temperature = "temp"
        case feelsLike = "feels_like"
        case pressure
        case humidity
        case dewPoint = "dew_point"
        case uvi
        case clouds
        case visibility
        case windSpeed = "wind_speed"
        case windDegree = "wind_deg"
        case weatherInfo = "weather"
    }
}

//MARK: -Hourly Forecast Data
struct HourlyForecast: Codable {
    var time: Double
    var temperature: Double
    var probOfPrecipitation: Double?
    var weatherInfo: [WeatherInfo]
    
    enum CodingKeys: String, CodingKey {
        case time = "dt"
        case temperature = "temp"
        case probOfPrecipitation = "pop"
        case weatherInfo = "weather"
    }
}

//MARK: -Daily Forecast Data
struct DailyForecast: Codable {
    var clouds, windDegree, humidity, pressure: Int
    var probOfPrecipitation, windSpeed: Double?
    var rain, snow: Double?
    var time, sunrise, sunset: Double
    var temperature: Temperature
    var feelsLike: FeelsLike
    var weatherInfo: [WeatherInfo]
    
    enum CodingKeys: String, CodingKey {
        case clouds
        case windDegree = "wind_deg"
        case humidity
        case pressure
        case probOfPrecipitation = "pop"
        case rain
        case snow
        case windSpeed = "wind_speed"
        case time = "dt"
        case sunrise
        case sunset
        case temperature = "temp"
        case feelsLike = "feels_like"
        case weatherInfo = "weather"
    }
}

//MARK: -Temperature Data
struct Temperature: Codable {
    var day, min, max, night, eve, morn: Double
}

//MARK: -Temperature Data
struct FeelsLike: Codable {
    var day, eve, morn, night: Double
}
