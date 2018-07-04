//
//  Constants.swift
//  poputka
//
//  Created by ITLabAdmin on 6/29/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

struct Colors {
    
    static let lightBlue = UIColor.init(netHex: 0xF4F7FE)
    static let blue = UIColor.init(netHex: 0x2968E2)
    static let gray = UIColor.init(netHex: 0xE0E0E0)
    static let darkGray = UIColor.init(netHex: 0x525252)
//    static let cellColor = UIColor.init(netHex: 0x1C4FB0)
    static let shadowGray = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.15)
    
    
}

struct SideMenu {
    
    struct ViewControllers {
        var title: String
        var sb: String
        var vc: String
    }
    
    static let menu = [ViewControllers(title: "Карта", sb: "Main", vc: "MainViewController"),
                       ViewControllers(title: "Логин", sb:"Login", vc: "LoginViewController")]

}
