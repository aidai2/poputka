//
//  BlueView.swift
//  poputka
//
//  Created by ITLabAdmin on 6/29/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class BlueView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpBlueView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUpBlueView()
    }
    
    private func setUpBlueView() {
        self.backgroundColor = Colors.lightBlue
        self.layer.cornerRadius = 2
    }
}
