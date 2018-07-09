//
//  RecoveryViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 6/29/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class RecoveryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func ConfirmPasswordButton(_ sender: BlueButton) {
        let vc = viewControllerWith(identifier: "SidebarOverlay", storyboard: "Main")
        present(vc, animated: true, completion: nil)
    }
}

