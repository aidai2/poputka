//
//  File.swift
//  poputka
//
//  Created by ITLabAdmin on 8/9/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import Foundation

struct Login: Decodable {
    var phone: String
    var password: String
    
    func toDictionary() -> [String: Any] {
        return ["phone" : phone,
                "password" : password]
    }
}

struct LoginGet : Decodable {
    var user_id : Int
    var token : String
    
    func toDictionary() -> [String: Any] {
        return ["user_id" : user_id,
                "token" : token]
    }
}



