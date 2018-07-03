//
//  RegistrationViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 6/29/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit


class RegistrationViewController: UIViewController {

    @IBOutlet weak var confidentialButton: UIButton!
    @IBOutlet weak var segmentedControl: HBSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSegmentedControl()
        confidentialButton.underline()
    
    }
    
    private func setupSegmentedControl() {
        segmentedControl.items = ["Водитель", "Пешеход"]
        segmentedControl.borderColor = .clear
        segmentedControl.selectedLabelColor = UIColor.white
        segmentedControl.unselectedLabelColor = UIColor.white
        segmentedControl.backgroundColor = Colors.gray
        segmentedControl.thumbColor = Colors.blue
        segmentedControl.font = UIFont(name: "Roboto-MediumItalic", size: 14)
    }
}
