//
//  RegistrationViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 6/29/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var confidentialButton: UIButton!
    @IBOutlet weak var segmentedControl: HBSegmentedControl!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet var citiesListView: UIView!
    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var cities: [City] = []
    private var isDriver = true
    private var cityId = 0
    private var backgroundButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCities()
        setupSegmentedControl()
        setupConfidentialButton()
        setupBackgroundButton()
        setupCitiesListView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        deleteBackBarTitle()
    }
    
    @IBAction func registredButton(_ sender: BlueButton) {
        let user = NewUser(phone: phoneTextField.text!, password: passwordTextField.text!, password_repeat: passwordTextField.text!, city_id:  cityId, is_driver: isDriver)
        ServerManager.shared.createUser(user: user, { (user) in
            
        }, error: showErrorAlert)
    }
    
    @IBAction func segmentedControlClicked(_ sender: HBSegmentedControl) {
        isDriver = sender.selectedIndex == 0 ? true : false
    }
    
    @IBAction func choseCityButton(_ sender: Any) {
        hideStatus(hide: false)
    }
    
    private func setupCities() {
        ServerManager.shared.getCities({ (allCities) in
            self.cities = allCities
            self.cityTableView.reloadData()
        }, error: showErrorAlert)
    }
    
    private func setupSegmentedControl() {
        segmentedControl.items = ["Водитель", "Пешеход"]
        segmentedControl.borderColor = .clear
        segmentedControl.selectedLabelColor = UIColor.white
        segmentedControl.unselectedLabelColor = UIColor.white
        segmentedControl.backgroundColor = Colors.gray
        segmentedControl.thumbColor = Colors.blue
        segmentedControl.font = UIFont(name: "Roboto-MediumItalic", size: 14)
    }
    
    private func setupConfidentialButton() {
        confidentialButton.underline()
    }
    
    private func setupBackgroundButton() {
        backgroundButton = setupDismissButton()
        backgroundButton.isHidden = true
        backgroundButton.addTarget(self, action: #selector(backgroundButtonClicked), for: .touchUpInside)
        view.addSubview(backgroundButton)
    }
    
    @objc private func backgroundButtonClicked() {
        hideStatus(hide: true)
    }
    
    private func setupCitiesListView() {
        citiesListView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width - 64, height: 300)
        citiesListView.center = view.center
        citiesListView.backgroundColor = Colors.lightBlue
        citiesListView.layer.cornerRadius = 20
        citiesListView.isHidden = true
        view.addSubview(citiesListView)
    }
    
    private func hideStatus(hide: Bool) {
        backgroundButton.isHidden = hide
        citiesListView.isHidden = hide
    }
}

extension RegistrationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoseCityCell") as! ChoseCityCell
        cell.setupCity(city: cities[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cityNameLabel.text = cities[indexPath.row].name
        cityId = cities[indexPath.row].id
        hideStatus(hide: true)
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 9
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}
