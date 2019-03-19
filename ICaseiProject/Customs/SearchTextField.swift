//
//  FieldTest.swift
//  ICaseiProject
//
//  Created by Thiago Cavalcante de Oliveira on 12/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class SearchTextField: UITextField {
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.configure()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    func configure() {
        attributedPlaceholder = NSAttributedString(string: "Pesquisar", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10, height: 2.0))
        let rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50, height: 30))
        
        let imageIcon = UIImage(named: "searchIcon")
        let imageView = UIImageView(image: imageIcon)
        imageView.frame = rightView.frame
        imageView.contentMode = .scaleAspectFit
        rightView.addSubview(imageView)
        self.leftView = leftView
        self.rightView = rightView
        leftViewMode = .always
        rightViewMode = .always
        
        returnKeyType = .search
    }
  
    
}
