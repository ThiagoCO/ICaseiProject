//
//  HomeViewController+HomeView.swift
//  ICaseiProject
//
//  Created by Thiago Cavalcante de Oliveira on 13/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

protocol HomeView {
    func createTable()
    func stopLoad()
    func startLoad()
    func reloadTableView()
}

extension HomeViewController: HomeView {
   
    func createTable() {
        createTableView()
    }
    
    func stopLoad() {
        activityIndicator.removeFromSuperview()
    }
    
    func startLoad() {
        self.view.addSubview(activityIndicator)
        activityIndicator.frame = self.view.frame
        activityIndicator.startAnimating()
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
  
   
}
