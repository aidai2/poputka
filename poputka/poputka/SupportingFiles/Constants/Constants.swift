//
//  Constants.swift
//  poputka
//
//  Created by ITLabAdmin on 6/29/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

struct Colors {
    
    static let lightBlue          = UIColor.init(netHex: 0xF4F7FE)
    static let blue               = UIColor.init(netHex: 0x2968E2)
    static let gray               = UIColor.init(netHex: 0xE0E0E0)
    static let darkGray           = UIColor.init(netHex: 0x525252)
    static let darkBlue           = UIColor.init(netHex: 0x1C4FB0)
    static let segmentedDarkBlue  = UIColor.init(netHex: 0x153F91)
    static let segmentedLightBlue = UIColor.init(netHex: 0x4A86FC)
    static let ratingNumberColor  = UIColor.init(netHex: 0x2968E2)
    static let cityNameColor      = UIColor.init(netHex: 0x707070)
    
    static let shadowGray = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.15)
   // static let formColor = UIColor.init(red: 21.0, green: 104.0, blue: 226.0, alpha: 1.0 )    
}

struct SideMenu {
    
    struct ViewControllers {
        var title: String
        var sb: String
        var vc: String
    }
    
    static let menu = [ViewControllers(title: "Карта", sb: "Main", vc: "MainViewController"),
//                       ViewControllers(title: "Карта", sb: "Main", vc: "MainViewController")
    ]
}

struct Setting {
    
    static let list = ["Всех", "Только водителей", "Только пассажиров", "Предложения системы"]
}
struct Font {
    static let robotoRegular = "Roboto-Regular"
    static let robotoMedium  = "Roboto-Medium"
    static let robotoLight   = "Roboto-Light"
}

struct ProfileInfo {
    
    static let list = ["Имя", "Номер телефона", "Город"]
}

struct GuidePages {
    
    struct Guide {
        var image: UIImage
        var shadow: UIImage
        var description: String
    }
    
    static let guides = [Guide(image: #imageLiteral(resourceName: "moneyIcon"), shadow: #imageLiteral(resourceName: "greenShadow"), description: "Cделайте каждую свою поездку выгодной!"),
                         Guide(image: #imageLiteral(resourceName: "pathIcon"), shadow: #imageLiteral(resourceName: "blueShadow"), description: "Выберите лучший маршрут!"),
                         Guide(image: #imageLiteral(resourceName: "smilesIcon"), shadow: #imageLiteral(resourceName: "yellowShadow"), description: "Находите себе приятных попутчиков!")]
}

struct EndPoints {
    static let cities  = "api/v1/cities/"
    static let newUser = "api/v1/users/create/"
    static let login   = "api/v1/users/login/"
    static let route = "api/v1/routes/"
}










