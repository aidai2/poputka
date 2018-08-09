//
//  RecoveryPhoneViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 6/29/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class RecoveryPhoneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        
//    }
    
    @IBAction func sendCode(_ sender: BlueButton) {
        present(storyboard: "Recovery", viewController: "RevoveryPasswordViewController")
    }
}
