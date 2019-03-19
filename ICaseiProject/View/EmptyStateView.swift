//
//  EmptyStateView.swift
//  ICaseiProject
//
//  Created by Thiago Cavalcante de Oliveira on 18/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class EmptyStateView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var sadLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("EmptyStateView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        sadLabel.transform = sadLabel.transform.rotated(by: CGFloat.pi / 2)
    }

}
