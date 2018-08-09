//
//  ProfileInfoCell.swift
//  poputka
//
//  Created by ITLabAdmin on 7/5/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class ProfileInfoCell: UITableViewCell {
    @IBOutlet weak var ProfileInfoLabel: UILabel!
    
    @IBOutlet weak var profileDataLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
