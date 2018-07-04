//
//  SidebarOverlay.swift
//  poputka
//
//  Created by ITLabAdmin on 7/3/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit
import SidebarOverlay

class SidebarOverlay: SOContainerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSidebar()
        setupMenuBarButton()
    }
    private func setupNavigationBar() {
        let image : UIImage = UIImage(named: "blue_logo")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        navigationItem.titleView = imageView
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = Colors.blue
        navigationController?.navigationBar.shadowImage = UIImage()
        //        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.layer.shadowColor = Colors.shadowGray.cgColor
        navigationController?.navigationBar.layer.shadowOffset  = CGSize(width: 0.0, height: 2.0)
        navigationController?.navigationBar.layer.shadowRadius = 4.0
        navigationController?.navigationBar.layer.shadowOpacity = 1.0
    }
    private func setupSidebar() {
        let topVC = viewControllerWith(identifier: "MainViewController", storyboard: "Main")
        topViewController = UINavigationController(rootViewController: topVC)
        
        let sideVC = viewControllerWith(identifier: "MenuViewController", storyboard: "Main")
        sideViewController = sideVC
    }
}
