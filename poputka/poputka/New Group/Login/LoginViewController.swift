//
//  LoginViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 6/29/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupClearNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    @IBAction func forgotPassword(_ sender: UIButton) {
        present(storyboard: "Recovery", viewController:"RecoveryPhoneViewController")
    }
    
    @IBAction func registrationButton(_ sender: RegistrationButton) {
        present(storyboard: "Registration", viewController: "RegistrationViewController")
    }
    
    @IBAction func EnterButton(_ sender: UIButton) {
        let vc = viewControllerWith(identifier: "SidebarOverlay", storyboard: "Main")
        present(vc, animated: true, completion: nil)
    }
}
