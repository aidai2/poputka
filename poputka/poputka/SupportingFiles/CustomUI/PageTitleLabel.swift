//
//  PageTitleLabel.swift
//  poputka
//
//  Created by ITLabAdmin on 7/2/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class PageTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabel()
    }
    

    private func setupLabel() {
        self.textColor = Colors.darkGray
        self.font = UIFont(name: "Roboto-Bold", size: 24)
    
    }
}
