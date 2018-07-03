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

        setupNavigationBar()
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
    @IBAction func EnterButton(_ sender: Any) {
        present(storyboard: "Main", viewController: "MainViewController")
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = Colors.blue
        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.layer.shadowColor = Colors.shadowGray.cgColor
        navigationController?.navigationBar.layer.shadowOffset  = CGSize(width: 0.0, height: 2.0)
        navigationController?.navigationBar.layer.shadowRadius = 4.0
        navigationController?.navigationBar.layer.shadowOpacity = 1.0
    
     
        
    }
}
