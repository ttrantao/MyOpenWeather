//
//  RootViewController.swift
//  MyOpenWeather
//
//  Created by Tran on 3/11/21.
//

import UIKit

class RootViewController: UIViewController {

    //MARK: - Declarations
    var viewModel: RootViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        bindViewModel()
        setupUI()
    }
    
    private func setupUI() {        
        view = RootView()
        (view as! RootView).setTableViewDataSourceDelegate(dataSourceDelegate: self)
    }
    
    // MARK: - View Model
    
    private func bindViewModel() {
        //init VM
        viewModel = RootViewModel()
        
        viewModel?.reloadVC = {
            DispatchQueue.main.async { [weak self] in
                (self?.view as! RootView).tableView.reloadData()
            }
        }
        
        viewModel?.updateActivityIndicator = { [weak self] () in
            DispatchQueue.main.async {
                let isLoading = self?.viewModel.isLoading ?? false
                if isLoading {
                    (self?.view as! RootView).activityIndicator.startAnimating()
                    UIView.animate(withDuration: 0.2, animations: {
                        (self?.view as! RootView).tableView.alpha = 0.0
                    })
                }else {
                    (self?.view as! RootView).activityIndicator.stopAnimating()
                    UIView.animate(withDuration: 0.2, animations: {
                        (self?.view as! RootView).tableView.alpha = 1.0
                    })
                }
            }
        }
        
        //show alert error - problem fetching data
        viewModel?.showAlertError = {
            self.showAlertError()
        }
    }
    
    //MARK: - Alert Error
    private func showAlertError() {
        let alertController = UIAlertController(title: "Error", message: "Problem fetching data", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}

