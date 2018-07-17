//
//  DataManager.swift
//  poputka
//
//  Created by ITLabAdmin on 7/17/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import Foundation

class DataManager {
    
    private let isUsedGuide = "isUsedGuide"
    
    class var shared: DataManager {
        struct Static {
            static let instance = DataManager()
        }
        return Static.instance
    }
    
    func setUserGuide() {
        UserDefaults.standard.set(true, forKey: isUsedGuide)
    }
    
    func isUsedGuides() -> Bool {
        return UserDefaults.standard.bool(forKey: isUsedGuide)
    }
}
