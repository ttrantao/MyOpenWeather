//
//  HourForecastCollectionViewCell.swift
//  MyOpenWeather
//
//  Created by Tran on 3/12/21.
//

import UIKit

class HourForecastCollectionViewCell: UICollectionViewCell {
    //MARK: - Declarations
    private var iconImageView: UIImageView = CustomImageView()
    private var timeLabel: UILabel = CustomLabelNormalSmallCenter()
    private var temperatureLabel: UILabel = CustomLabelNormalSmallCenter()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setIconImage()
        setTimeLabel()
        setTemperatureLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setTimeLabel() {
        addSubview(timeLabel)
        
        timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: iconImageView.topAnchor, constant: -5).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    private func setIconImage() {
        addSubview(iconImageView)
        
        iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setTemperatureLabel() {
        addSubview(temperatureLabel)
        
        temperatureLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 5).isActive = true
        temperatureLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    func setData(time: Double, withImage image: String, withTemperature temp: Int) {
        
        timeLabel.text = Date().getHourString(forTime: time)
        temperatureLabel.text = String(temp)
        iconImageView.kf.indicatorType = .activity
        iconImageView.kf.setImage(with: URL(string: Constants.openWeatherIconURL + image + "@2x.png"))
    }
}
