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
    private let userKey = "user"
    
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
    
    func setUser(user: User) {
        UserDefaults.standard.set(user.toDictionary(), forKey: userKey)
    }
    
    func getUser() -> [String: Any]? {
        if let user = UserDefaults.standard.value(forKey: userKey) {
            return (user as! [String : Any])
        }
        return nil
    }
}
