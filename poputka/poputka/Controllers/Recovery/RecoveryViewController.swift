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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

            let image : UIImage = UIImage(named: "blue_logo")!
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            navigationItem.titleView = imageView
        }
    
    @IBAction func ConfirmPasswordButton(_ sender: BlueButton) {
      let vc = viewControllerWith(identifier: "SidebarOverlay", storyboard: "Main")
        present(vc, animated: true, completion: nil)
    }
}

