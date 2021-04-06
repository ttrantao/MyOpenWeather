//
//  HourlyForecastTableViewCell.swift
//  MyOpenWeather
//
//  Created by Tran on 3/12/21.
//

import UIKit

class HourlyForecastTableViewCell: UITableViewCell {
    //MARK: - Declarations
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.alwaysBounceVertical = false
        
        collectionView.register(HourForecastCollectionViewCell.self, forCellWithReuseIdentifier: Constants.hourForecastCellId)
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setCollectionView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setCollectionView() {
        contentView.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func setCollectionViewDataSourceDelegate <obj: UICollectionViewDataSource & UICollectionViewDelegate> (
        dataSourceDelegate: obj, forRow row: Int) {
        collectionView.dataSource = dataSourceDelegate
        collectionView.delegate = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
}
