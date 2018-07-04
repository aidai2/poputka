//
//  MenuViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 7/3/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit
class MenuViewController: UIViewController {
    
    @IBOutlet weak var profileView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileView.layer.backgroundColor = Colors.blue.cgColor
    }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SideMenu.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.backgroundColor = UIColor.clear
        cell.menuLabel.text = SideMenu.menu[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcs = SideMenu.menu[indexPath.row]
        let vc = viewControllerWith(identifier: vcs.vc, storyboard: vcs.sb)
        so_containerViewController?.topViewController = UINavigationController(rootViewController: vc)
        so_containerViewController?.isSideViewControllerPresented = false
    }
    
}
