//
//  CreateRoute.swift
//  poputka
//
//  Created by ITLabAdmin on 8/9/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import Foundation
struct CreateRoute : Decodable {
    
    var description : String?
    var available_seats : Int?
    var isDriver : Bool
    var isBag : Bool?
    var isLocal : Bool?
    var start_address : String
    var end_address : String
    var start_latitude : String
    var start_longitude : String
    var end_latitude : String
    var end_longitude : String
    var start_time : Int
    var points : [Points]
    
    func toDictionary() -> [String: Any] {
        return ["description" : description,
                "available_seats" : available_seats,
                "isDriver" : isDriver,
                "isBag" : isBag,
                "isLocal" : isLocal,
                "start_address" : start_address,
                "end_address" : end_address,
                "start_latitude" : start_latitude,
                "start_longitude" : start_longitude,
                "end_latitude" : end_latitude,
                "end_longitude" : end_longitude,
                "start_time" : start_time,
                "points" : points]
    }
}

struct Points : Decodable {
    var lat : String?
    var lon : String?
    
    func toDictionary() -> [String: Any] {
        return ["lat" : lat,
                "lon" : lon]
    }
}

struct Route : Decodable {
    var id : Int
    var owner : String
    var description : String?
    var available_seats : Int?
    var isDriver : Bool
    var isBag : Bool?
    var isLocal : Bool?
    var start_address : String
    var end_address : String
    var start_latitude : String
    var start_longitude : String
    var end_latitude : String
    var end_longitude : String
    var start_time : Int
    var points : [GetPoints]
    
    func toDictionary() -> [String: Any] {
        return ["id" : id,
                "owner" : owner,
                "description" : description,
                "available_seats" : available_seats,
                "isDriver" : isDriver,
                "isBag" : isBag,
                "isLocal" : isLocal,
                "start_address" : start_address,
                "end_address" : end_address,
                "start_latitude" : start_latitude,
                "start_longitude" : start_longitude,
                "end_latitude" : end_latitude,
                "end_longitude" : end_longitude,
                "start_time" : start_time,
                "points" : points]
    }
}

struct GetPoints : Decodable {
    var lat : String?
    var lon : String?
    
    func toDictionary() -> [String: Any] {
        return ["lat" : lat,
                "lon" : lon]
    }
}
