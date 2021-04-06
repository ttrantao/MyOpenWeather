//
//  CurrentWeatherTableViewCell.swift
//  MyOpenWeather
//
//  Created by Tran on 3/12/21.
//

import UIKit

class CurrentWeatherTableViewCell: UITableViewCell {
    //MARK: - Declarations
    private var todayIconImageView: UIImageView = CustomImageView()
    
    private var cityLabel: UILabel = CustomLabelTitle()
    
    private var temperatureLabel: UILabel = CustomLabelNormalBig()
    
    private var descLabel: UILabel = CustomLabelNormalBig()
    
    private var timeLabel: UILabel = CustomLabelText()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setIconImage()
        setCityLabel()
        setTemperatureLabel()
        setDescLabel()
        setTimeLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setIconImage() {
        addSubview(todayIconImageView)
        
        todayIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        todayIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        todayIconImageView.widthAnchor.constraint(equalTo: heightAnchor, constant: -10).isActive = true
        todayIconImageView.heightAnchor.constraint(equalTo: heightAnchor, constant: -10).isActive = true
    }
    
    private func setCityLabel() {
        addSubview(cityLabel)
        
        cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: todayIconImageView.trailingAnchor, constant: 20).isActive = true
        cityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    private func setTemperatureLabel() {
        addSubview(temperatureLabel)
        
        temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10).isActive = true
        temperatureLabel.leadingAnchor.constraint(equalTo: cityLabel.leadingAnchor).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: cityLabel.trailingAnchor).isActive = true
    }
    
    private func setDescLabel()  {
        addSubview(descLabel)
        
        descLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10).isActive = true
        descLabel.leadingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor).isActive = true
        descLabel.trailingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor).isActive = true
    }
    
    private func setTimeLabel() {
        addSubview(timeLabel)
        
        timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: descLabel.leadingAnchor).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: descLabel.trailingAnchor).isActive = true
    }
    
    func setData(time: Double, withImage image: String, withTemperature temperature: Int, withCity city: String, withDescription desc: String) {
        temperatureLabel.text = "\(temperature)°C"
        todayIconImageView.kf.indicatorType = .activity
        todayIconImageView.kf.setImage(with: URL(string: Constants.openWeatherIconURL + image + "@2x.png"))
        descLabel.text = desc.capitalizeFirstLetter()
        cityLabel.text = city
        timeLabel.text = "Last update: \(Date().getDateTimeString(forTime: time))"
    }
}
