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
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
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
        let login = Login(phone: phoneTextField.text!, password: passwordTextField.text!)
        ServerManager.shared.login(login: login, { (login) in
            print(login.token)
            let vc = self.viewControllerWith(identifier: "SidebarOverlay", storyboard: "Main")
            self.present(vc, animated: true, completion: nil)
        }, error: showErrorAlert)
    }
    
    //f25980fa937f5048855bd3d0f2e894300bcd2ca1
    //f25980fa937f5048855bd3d0f2e894300bcd2ca1
}
