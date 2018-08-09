//
//  SettingViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 8/7/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Setting.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingTableViewCell
        cell.settingLabel.text = Setting.list[indexPath.row]
        cell.settingLabel.textColor = Colors.darkGray
        cell.settingLabel.font = UIFont(name: Font.robotoMedium, size: 14)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
