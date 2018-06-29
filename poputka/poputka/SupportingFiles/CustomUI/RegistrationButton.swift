//
//  RegistrationButton.swift
//  poputka
//
//  Created by ITLabAdmin on 6/29/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class RegistrationButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupRegistrationButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupRegistrationButton()
    }
    
    private func setupRegistrationButton() {
        self.backgroundColor = Colors.gray
        self.layer.cornerRadius = 15
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18)
    }
}
