//
//  GuidePagesCell.swift
//  poputka
//
//  Created by ITLabAdmin on 7/17/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class GuidePagesCell: UICollectionViewCell {
    
    @IBOutlet weak var welcomeIcon: UIImageView!
    @IBOutlet weak var shadowImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func fillGuides(guide: GuidePages.Guide) {
        welcomeIcon.image = guide.image
        shadowImage.image = guide.shadow
        descriptionLabel.text = guide.description
        descriptionLabel.textColor = Colors.blue
        descriptionLabel.font = UIFont(name: Font.robotoRegular, size: 28)
    }
}
