//
//  RootViewController+UICollectionView.swift
//  MyOpenWeather
//
//  Created by Tran on 3/12/21.
//

import UIKit

extension RootViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.hourlyForecastVM.numberOfHours ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            cell.layoutIfNeeded()
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.hourForecastCellId, for: indexPath) as? HourForecastCollectionViewCell else {
            fatalError("Error to dequeue Forecast collection view cell")
        }

        //set cell VM
        if let cellVM = viewModel?.hourlyForecastVM.viewModel(forIndex: indexPath.row) {
            cell.setData(time: cellVM.time, withImage: cellVM.weatherInfoIconIdString, withTemperature: cellVM.temperature)
        }
        return cell
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout {
    // MARK: - Collection View Delegate Flow Layout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 80)
    }

}
