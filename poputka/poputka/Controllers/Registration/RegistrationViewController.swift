//
//  RegistrationViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 6/29/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit
import Jelly

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var confidentialButton: UIButton!
    @IBOutlet weak var segmentedControl: HBSegmentedControl!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSegmentedControl()
        confidentialButton.underline()
    }
    
    @IBAction func choseCityButton(_ sender: Any) {
        setupJelly()
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    private func setupJelly() {
        var jellyAnimator: JellyAnimator?
        let customCornerSlideInPresentation = JellySlideInPresentation(cornerRadius: 10,
                                                                       backgroundStyle: .dimmed(alpha: 0.3),
                                                                       jellyness: .jellier,
                                                                       duration: .slow,
                                                                       directionShow: .bottom,
                                                                       directionDismiss: .right,
                                                                       widthForViewController: .custom(value: view.frame.size.width - 64),
                                                                       heightForViewController: .custom(value: view.frame.size.height-300))
        
        let vc = viewControllerWith(identifier: "CityViewController", storyboard: "Registration")
        jellyAnimator = JellyAnimator(presentation: customCornerSlideInPresentation)
        jellyAnimator?.prepare(viewController: vc)
        present(vc, animated: true, completion: nil)
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
    
    @IBAction func registredButton(_ sender: BlueButton) {
        present(storyboard: "Login", viewController: "LoginViewController")
    }
}
