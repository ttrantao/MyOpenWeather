//
//  RootViewModel.swift
//  MyOpenWeather
//
//  Created by Tran on 3/11/21.
//

import Foundation

class RootViewModel {
    
    // MARK: - Constants
    var weatherClient : WeatherClient!
    
    private(set) var weatherData : Weather! {
        didSet {
            //when data is set, should create VM
            self.reloadVC?()
        }
    }
    
    var currentWeatherVM: CurrentWeatherViewModel! {
        CurrentWeatherViewModel(temperature: Int(round(weatherData.currentWeather.temperature)),
                                                  city: Constants.city,
                                                  iconIdString: weatherData.currentWeather.weatherInfo[0].icon,
                                                  desc: weatherData.currentWeather.weatherInfo[0].description,
                                                  time: weatherData.currentWeather.time)
    }
    
    var hourlyForecastVM: HourlyForecastViewModel! {
        HourlyForecastViewModel(hourlyForecastData: weatherData.hourlyForecast)
    }
    
    var dailyForecastVM: DailyForecastViewModel! {
        DailyForecastViewModel(dailyForecastData: weatherData.dailyForecast)
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateActivityIndicator?()
        }
    }
    
    var reloadVC: (() -> ())?
    var updateActivityIndicator: (() -> ())?
    var showAlertError: (() -> ())?
    
    // MARK: - Init

    init() {
        self.weatherClient = WeatherClient()
        
        fetchWeather()
    }
    
    
    func fetchWeather() {
        self.isLoading = true
        weatherClient.getWeather() { [weak self] result in
            
            self?.isLoading = false

            switch result {
            case .success(let weather):
                self?.weatherData = weather
            case .failure:
                self?.weatherData = nil
                self?.showAlertError?()
                
            }
        }
    }
 
    var numberOfSections: Int {
        return 3
    }
}
