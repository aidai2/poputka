//
//  ProfileViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 7/5/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var segmentedControl: HBSegmentedControl!
    @IBOutlet weak var profilePageTitle: UILabel!
    @IBOutlet weak var profileView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupSegmentedControl()
        setupBlueNavigationBar()
        setupMenuBarButton()
    }
    
    private func setupView() {
        profileView.backgroundColor = Colors.blue
        profilePageTitle.text = "Профиль"
        profilePageTitle.textColor = UIColor.white
        profilePageTitle.font = UIFont(name: "Roboto-Bold", size: 20)
    }
    
    private func setupSegmentedControl() {
        segmentedControl.items = ["Водитель", "Пешеход"]
        segmentedControl.borderColor = .clear
        segmentedControl.selectedLabelColor = UIColor.white
        segmentedControl.unselectedLabelColor = UIColor.white
        segmentedControl.backgroundColor = Colors.segmentedDarkBlue
        segmentedControl.thumbColor = Colors.segmentedLightBlue
        segmentedControl.font = UIFont(name: "Roboto-MediumItalic", size: 14)
    }
    
    private func setupBlueNavigationBar() {
        navigationController?.navigationBar.barTintColor = Colors.blue
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        let image: UIImage = UIImage(named: "whiteLogo")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        navigationItem.titleView = imageView

    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileInfo.list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileInfoCell", for: indexPath) as! ProfileInfoCell
        cell.backgroundColor = UIColor.clear
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        cell.ProfileInfoLabel.text = ProfileInfo.list[indexPath.row]
        cell.ProfileInfoLabel.textColor = UIColor.white
        cell.ProfileInfoLabel.font = UIFont(name: "Roboto-Regular", size: 14.0)
        cell.profileDataLabel.text = "bvz"
        cell.profileDataLabel.font = UIFont(name: "Roboto-Bold", size: 18.0)
        cell.profileDataLabel.textColor = UIColor.white

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}


