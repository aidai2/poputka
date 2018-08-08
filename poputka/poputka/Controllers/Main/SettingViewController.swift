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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingTableViewCell
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
