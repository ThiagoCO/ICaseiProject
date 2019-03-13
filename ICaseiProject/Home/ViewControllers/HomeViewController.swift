//
//  HomeViewController.swift
//  ICaseiProject
//
//  Created by Thiago Cavalcante de Oliveira on 12/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var centerVerticalConstraint: NSLayoutConstraint!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.addTarget(self, action: #selector(editingDidEnd), for: .primaryActionTriggered)
    }
    
    @objc func editingDidEnd(_ sender: UITextField) {
        centerVerticalConstraint?.isActive = false
        searchTextField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        createTableView()
    }
    
    private func createTableView() {
        tableView = UITableView()
        tableView.alpha = 0
        view.addSubview(tableView)
        
        tableView.backgroundColor = .red
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.register(UINib(nibName: "VideoCell", bundle: Bundle.main), forCellReuseIdentifier: "VideoCell")
        
        setupTableView()
        UIView.animate(withDuration: 0.5) {
            self.tableView.alpha = 1
        }
    }
    


}

