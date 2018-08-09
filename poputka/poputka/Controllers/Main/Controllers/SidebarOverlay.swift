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
        
        setupSidebar()
    }
    
    private func setupSidebar() {
        let topVC = viewControllerWith(identifier: "MainViewController", storyboard: "Main")
        topViewController = UINavigationController(rootViewController: topVC)
        
        let sideVC = viewControllerWith(identifier: "MenuViewController", storyboard: "Main")
        sideViewController = sideVC
    }
}
