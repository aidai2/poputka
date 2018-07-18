//
//  CityViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 7/18/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class CityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cityTableView: UITableView!
    private var cities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCities()
        view.backgroundColor = Colors.lightBlue
    }
    
    private func setupCities() {
        ServerManager.shared.getCities({ (allCities) in
            self.cities = allCities
            self.cityTableView.reloadData()
        }, error: showErrorAlert)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoseCityCell") as! ChoseCityCell
        cell.cityNameLabel.text = cities[indexPath.row].name
        cell.cityNameLabel.textColor = Colors.cityNameColor
        cell.cityNameLabel.font = UIFont(name: "Roboto-Light", size: 16)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    



}
