//
//  RootViewController+UITableView.swift
//  MyOpenWeather
//
//  Created by Tran on 3/12/21.
//

import UIKit

extension RootViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.weatherData != nil {
            switch section {
                case 0:
                    return 1
                case 1:
                    return 1
                case 2:
                    return viewModel?.dailyForecastVM.numberOfDays ?? 0
                default: return 0
            }
        }
        else { return 0 }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
              guard let cell = tableView.dequeueReusableCell(
                        withIdentifier: Constants.currentWeatherCellId, for: indexPath) as? CurrentWeatherTableViewCell else {
                fatalError("Error to dequeue current weather cell")
              }
                if let cellVM = viewModel?.currentWeatherVM {
                    cell.setData(time: cellVM.time, withImage: cellVM.iconIdString, withTemperature: cellVM.temperature, withCity: cellVM.city, withDescription: cellVM.desc)
                }
              return cell

            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.hourlyForecastCellId, for: indexPath) as? HourlyForecastTableViewCell else {
                    fatalError("Error to dequeue Forecast table view cell")
                }

                cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
                return cell

            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.dailyForecastCellId, for: indexPath) as? DailyForecastTableViewCell else {
                    fatalError("Error to dequeue daily forecast cell")
                }

                //set cell VM
                if let cellVM = viewModel?.dailyForecastVM.viewModel(forIndex: indexPath.row) {
                    cell.setData(time: cellVM.time, withImage: cellVM.weatherInfoIconIdString, withMinTemperature: cellVM.tempMin, withMaxTemperature: cellVM.tempMax)
                }

              return cell
            default: fatalError()
        }
    }
    
    
}

extension RootViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 0: return 150.0
            case 1: return 80.0
            case 2: return 40.0
            default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
