//
//  Style.swift
//  poputka
//
//  Created by ITLabAdmin on 7/3/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import Foundation

struct  Style: Decodable {
    var featureType: String
    var elementType: String
    var stylers: [Stylers]
}

struct Stylers: Decodable{
    var color: String
}
