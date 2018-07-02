//
//  SidebarOverlayViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 7/2/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit
import SidebarOverlay

class SidebarOverlayViewController: SOContainerViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuBarButton()
        setupSideBar()
    }
    
    private func setupSideBar() {
        menuSide = .left
        
       sideViewController = sideVC
        
        let secondSB = UIStoryboard(name: "Main", bundle: nil)
        let sideVC = secondSB.instantiateViewController(withIdentifier: "MenuViewController")
        sideViewController = sideVC
        
        let firstSB = UIStoryboard(name: "Main", bundle: nil)
        let topVC = firstSB.instantiateViewController(withIdentifier: "MainViewController")
        topViewController = topVC
    }
}

