//
//  DailyForecastTableViewCell.swift
//  MyOpenWeather
//
//  Created by Tran on 3/12/21.
//

import UIKit
import Kingfisher

class DailyForecastTableViewCell: UITableViewCell {
    //MARK: - Declarations
    private var iconImageView: UIImageView = CustomImageView()
    private var dayLabel: UILabel = CustomLabelNormalBig()
    private var temperatureMinLabel: UILabel = CustomLabelNormalSmallCenter()
    private var temperatureMaxLabel: UILabel = CustomLabelNormalSmallCenter()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setIconImage()
        setDayLabel()
        setTempMaxLabel()
        setTempMinLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setDayLabel() {
        addSubview(dayLabel)
        
        dayLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        dayLabel.trailingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: -5).isActive = true
    }
    
    private func setIconImage() {
        addSubview(iconImageView)
        
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setTempMaxLabel() {
        addSubview(temperatureMaxLabel)
        
        temperatureMaxLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        temperatureMaxLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true

    }
    
    private func setTempMinLabel() {
        addSubview(temperatureMinLabel)
        
        temperatureMinLabel.leadingAnchor.constraint(equalTo: temperatureMaxLabel.trailingAnchor, constant: 5).isActive = true
        temperatureMinLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        temperatureMinLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        temperatureMinLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true

    }
    
    func setData(time: Double, withImage image: String, withMinTemperature minTemp: Int, withMaxTemperature maxTemp: Int) {
        
        dayLabel.text = Date().getDateString(forTime: time)
        temperatureMinLabel.text = String(minTemp)
        temperatureMaxLabel.text = String(maxTemp)
        iconImageView.kf.indicatorType = .activity
        iconImageView.kf.setImage(with: URL(string: Constants.openWeatherIconURL + image + "@2x.png"))
    }
}
