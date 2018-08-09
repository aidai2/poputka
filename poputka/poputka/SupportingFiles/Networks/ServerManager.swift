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
        self.get(api: EndPoints.cities, completion: { (data) in
            do {
                guard let data = data else { return }
                let cities = try JSONDecoder().decode([City].self, from: data)
                completion(cities)
            } catch let e {
                error(e.localizedDescription)
            }
        }, error: error)
    }
    
    func createUser(user: NewUser, _ completion: @escaping (User) -> Void, error: @escaping (String)-> Void) {
        self.post(api: EndPoints.newUser, headers: nil, parameters: user.toDictionary(), completion: { (data) in
            do {
                guard let data = data else { return }
                let user = try JSONDecoder().decode(User.self, from: data)
                completion(user)
            } catch let e {
                error(e.localizedDescription)
            }
        }, error: error)
    }
    
    func login(login: Login, _ completion: @escaping (LoginGet) -> Void, error: @escaping (String)-> Void){
        self.post(api: EndPoints.login, headers: nil, parameters: login.toDictionary(), completion: { (data) in
            do {
                guard let data = data else { return }
                let login = try JSONDecoder().decode(LoginGet.self, from: data)
                completion(login)
            } catch let e {
                error(e.localizedDescription)
            }
        }, error: error)
    }
   
    func route(route: CreateRoute, _ completion: @escaping (Route) -> Void, error: @escaping (String)-> Void){
        let header = ["Authorization": "f25980fa937f5048855bd3d0f2e894300bcd2ca1"]
        self.post(api: EndPoints.route, headers: header, parameters: route.toDictionary(), completion: { (data) in
            do {
                guard let data = data else { return }
                let route = try JSONDecoder().decode(Route.self, from: data)
                completion(route)
            } catch let e {
                error(e.localizedDescription)
            }
        }, error: error)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
