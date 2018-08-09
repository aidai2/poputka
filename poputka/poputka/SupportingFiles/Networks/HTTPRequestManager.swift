//
//  HTTPRequestManager.swift
//  poputka
//
//  Created by ITLabAdmin on 7/17/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import Foundation
import Alamofire
import SystemConfiguration

class HTTPRequestManager {
    
    typealias SuccessHandler = (Data?) -> Void
    typealias FailureHandler = (String)-> Void
    typealias Parameter = [String: Any]?

    private let url = "http://165.227.147.84:3333/"
    
    private func request(method: HTTPMethod, endpoint: String, headers: Parameter, parameters: Parameter, completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        
        if !isConnectedToNetwork() {
            error("Нет подключения к интернету")
            return
        }
        
        let APIaddress = "\(url)\(endpoint)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        var header: HTTPHeaders = [:]
//        header["Content-Type"] = "application/json"
//        header["Authorization"] = "Token 9d60577f3ca0beb937db6f54fccc54ba63b04164"
        if (headers?.count == 1) {
            header["Authorization"] = "Token \(headers!["Authorization"] ?? "")"
        }
        
        
        Alamofire.request(APIaddress!, method: method, parameters: parameters, encoding: JSONEncoding.default , headers: header).responseJSON { (response:DataResponse<Any>) in
            
            guard response.response != nil else {
                error("Не удалось загрузить данные.")
                return
            }
            
            guard let statusCode = response.response?.statusCode else {
                error("Не удалось получить код статуса HTTP")
                return
            }
            
            print("\(statusCode) - \(endpoint)")
            
            switch(statusCode) {
            case HTTPStatusCode.unauthorized.statusCode:
                error("Вам нужно войти, чтобы выполнить это действие")
                break
            case HTTPStatusCode.ok.statusCode,
                 HTTPStatusCode.accepted.statusCode,
                 HTTPStatusCode.created.statusCode:
                
                completion(response.data)
                break
            default:
                
                do {
                    guard let data = response.data else { return }
                    let errorMessage = try JSONDecoder().decode(ErrorMessage.self, from: data)
                    print(errorMessage)
                    if let message = errorMessage.detail {
                        error(message)
                    }
                } catch let err {
                    error(err.localizedDescription)
                }
            }
        }
    }
    
    internal func post(api: String, headers: Parameter, parameters: Parameter, completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        request(method: .post, endpoint: api, headers: headers, parameters: parameters, completion: completion, error: error)
    }
    
//    internal func delete(api: String, parameters: Parameter, completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
//        request(method: .delete, endpoint: api, parameters: parameters, completion: completion, error: error)
//    }
//
//    internal func put(api: String, parameters: Parameter, completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
//        request(method: .put, endpoint: api, parameters: parameters, completion: completion, error: error)
//    }
    
    internal func get(api: String, completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        request(method: .get, endpoint: api, headers: nil, parameters: nil, completion: completion, error: error)
    }
    
    private func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
}
