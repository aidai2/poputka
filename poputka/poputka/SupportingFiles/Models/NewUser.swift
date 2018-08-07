//
//  NewUser.swift
//  poputka
//
//  Created by ITLabAdmin on 8/7/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import Foundation

struct NewUser: Decodable {
    var phone: String
    var password: String
    var password_repeat: String
    var city_id: Int
    var is_driver: Bool
//    var first_name: String
//    var last_name: String
//    var gender: Int
//    var birth_date: String
    
    func toDictionary() -> [String : Any] {
        return ["phone" : phone,
                "password" : password,
                "password_repeat" : password_repeat,
                "is_driver" : is_driver,
                "city_id" : city_id]
    }
}

struct User: Decodable {
    var user_id: Int
    var first_name: String
    var last_name: String
    var gender: Int
    var birth_date: String
    var is_driver: Bool
    var photo: String?
    var city_id: Int
}

