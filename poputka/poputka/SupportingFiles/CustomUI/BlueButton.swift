//
//  BlueButton.swift
//  poputka
//
//  Created by ITLabAdmin on 6/29/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class BlueButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUpButton()
    }
    
    private func setUpButton() {
        self.backgroundColor = Colors.blue
        self.layer.cornerRadius = 15
        self.layer.shadowColor = Colors.lightBlue.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 1
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18)
    }
}
