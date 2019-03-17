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
    var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    var viewModel: HomeViewModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HomeViewModel(view: self)
        
        searchTextField.addTarget(self, action: #selector(editingDidEnd), for: .primaryActionTriggered)
        

    }
    
    
    @objc func editingDidEnd(_ sender: UITextField) {
        animateSearchField()
        viewModel?.nextPage = nil
        viewModel?.videoList = nil
        viewModel?.getVideoList(textSearch: sender.text)
        sender.resignFirstResponder()
        
    }
    
    
    
    func animateSearchField() {
        centerVerticalConstraint?.isActive = false
        searchTextField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)

    }
    
}

