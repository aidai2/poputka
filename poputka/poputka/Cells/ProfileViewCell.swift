//
//  ProfileViewCell.swift
//  poputka
//
//  Created by ITLabAdmin on 7/9/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class ProfileViewCell: UITableViewCell {
    @IBOutlet weak var userRoleLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
