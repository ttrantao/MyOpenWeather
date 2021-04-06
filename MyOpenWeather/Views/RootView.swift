//
//  RootView.swift
//  MyOpenWeather
//
//  Created by Tran on 3/12/21.
//

import UIKit

class RootView: UIView {
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        return activityIndicator
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(CurrentWeatherTableViewCell.self, forCellReuseIdentifier: Constants.currentWeatherCellId)
        tableView.register(HourlyForecastTableViewCell.self, forCellReuseIdentifier: Constants.hourlyForecastCellId)
        tableView.register(DailyForecastTableViewCell.self, forCellReuseIdentifier: Constants.dailyForecastCellId)
        
        tableView.separatorColor = .clear
        
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setTableView()
        setActivityIndicator()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setActivityIndicator() {
        addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setTableView() {
        addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func setTableViewDataSourceDelegate <obj: UITableViewDataSource & UITableViewDelegate> (dataSourceDelegate: obj) {
        tableView.dataSource = dataSourceDelegate
        tableView.delegate = dataSourceDelegate
        tableView.reloadData()
    }
}
