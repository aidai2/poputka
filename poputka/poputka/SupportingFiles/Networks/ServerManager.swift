//
//  ServerManager.swift
//  poputka
//
//  Created by ITLabAdmin on 7/17/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import Foundation
import Alamofire

class ServerManager: HTTPRequestManager {
    
    class var shared: ServerManager {
        struct Static {
            static let instance = ServerManager()
        }
        return Static.instance
    }
    
    func getCities(_ completion: @escaping ([City])-> Void, error: @escaping (String)-> Void) {
        self.get(api: "api/v1/cities/", completion: { (data) in
            do {
                guard let data = data else { return }
                let cities = try JSONDecoder().decode([City].self, from: data)
                completion(cities)
            } catch let e {
                error(e.localizedDescription)
            }
        }, error: error)
    }
}
