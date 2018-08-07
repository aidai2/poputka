//
//  ChoseCityCell.swift
//  poputka
//
//  Created by ITLabAdmin on 7/18/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class ChoseCityCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func setupCity(city: City) {
        cityNameLabel.text = city.name
        cityNameLabel.textColor = Colors.cityNameColor
        cityNameLabel.font = UIFont(name: Font.robotoLight, size: 16)
    }
}
