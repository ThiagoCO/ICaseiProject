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
    func viewAlertMessage()
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
        tableView?.reloadData()
    }
    
    func viewAlertMessage() {
        tableView?.isHidden = true
        let viewBad = EmptyStateView()
        view.addSubview(viewBad)
        viewBad.translatesAutoresizingMaskIntoConstraints = false
        viewBad.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        viewBad.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        viewBad.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant:
            20).isActive = true
    }
   
}
