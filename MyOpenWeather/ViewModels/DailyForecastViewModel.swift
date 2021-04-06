//
//  DailyForecastViewModel.swift
//  MyOpenWeather
//
//  Created by Tran on 3/12/21.
//

import Foundation

struct DailyForecastViewModel {
    let dailyForecastData: [DailyForecast]
    
    var numberOfDays: Int {
        dailyForecastData.count
    }
    
    func viewModel(forIndex index: Int) -> DayDetailViewModel {
        let data: DailyForecast! = dailyForecastData[index]
        
        return DayDetailViewModel(clouds: data.clouds,
                                  deg: data.windDegree,
                                  humidity: data.humidity,
                                  pressure: data.pressure,
                                  probOfPrecipitation: data.probOfPrecipitation,
                                  rain: data.rain,
                                  snow: data.snow,
                                  speed: data.windSpeed,
                                  time: data.time,
                                  sunriseTime: data.sunrise,
                                  sunsetTime: data.sunset,
                                  tempDay: Int(round(data.temperature.day)),
                                  tempMin: Int(round(data.temperature.min)),
                                  tempMax: Int(round(data.temperature.max)),
                                  tempNight: Int(round(data.temperature.night)),
                                  tempEve: Int(round(data.temperature.eve)),
                                  tempMorn: Int(round(data.temperature.morn)),
                                  feelsLikeDay: Int(round(data.feelsLike.day)),
                                  feelsLikeEve: Int(round(data.feelsLike.eve)),
                                  feelsLikeMorn: Int(round(data.feelsLike.morn)),
                                  feelsLikeNight: Int(round(data.feelsLike.night)),
                                  weatherInfoDesc: data.weatherInfo[0].description,
                                  weatherInfoMain: data.weatherInfo[0].main,
                                  weatherInfoIconIdString: data.weatherInfo[0].icon)
    }
}
