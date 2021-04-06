//
//  HourlyForecastViewModel.swift
//  MyOpenWeather
//
//  Created by Tran on 3/12/21.
//

import Foundation

struct HourlyForecastViewModel {
    let hourlyForecastData: [HourlyForecast]

    var numberOfHours: Int {
        hourlyForecastData.count
    }

    func viewModel(forIndex index: Int) -> HourDetailViewModel {
        let data: HourlyForecast! = hourlyForecastData[index]
        
        return HourDetailViewModel(time: data.time,
                                   temperature: Int(round(data.temperature)),
                                   weatherInfoIconIdString: data.weatherInfo[0].icon)
    }
}
