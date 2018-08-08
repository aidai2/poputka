//
//  MenuViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 7/3/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit
class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
    }
    
    @IBAction func profileButton(_ sender: Any) {
        let vc = viewControllerWith(identifier: "ProfileViewController", storyboard: "Profile")
        present(vc, animated: true, completion: nil)
    }
    

}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return SideMenu.menu.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileViewCell", for: indexPath) as! ProfileViewCell
            cell.backgroundColor = Colors.blue
            cell.userNameLabel.text = "name"
            cell.userRoleLabel.text = "role"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
            cell.backgroundColor = UIColor.clear
            cell.menuLabel.text = SideMenu.menu[indexPath.row].title
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let vc = viewControllerWith(identifier: "ProfileViewController", storyboard: "Profile")
            so_containerViewController?.topViewController = UINavigationController(rootViewController: vc)
            so_containerViewController?.isSideViewControllerPresented = false
        } else {
            let vcs = SideMenu.menu[indexPath.row]
            let vc = viewControllerWith(identifier: vcs.vc, storyboard: vcs.sb)
            so_containerViewController?.topViewController = UINavigationController(rootViewController: vc)
            so_containerViewController?.isSideViewControllerPresented = false
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 220
        }
        return 60
    }
}
