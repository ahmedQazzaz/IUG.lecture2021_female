//
//  LoginService.swift
//  ContinueWorking
//
//  Created by Ahmed Qazzaz on 01/12/2021.
//

import UIKit


class LoginService{
    
    func login(usingUsername u: String,
               andPassword p: String,
               atComplete handler:(_:Any)->Void){
        
//        "http://google.com?a=123&p=123"
        
        var urlComponent = URLComponents(string: "http://...")
        urlComponent?.queryItems = [URLQueryItem(name: "a", value: "12 3"),
                                    URLQueryItem(name: "b", value: "456")]
        
        if let url = urlComponent?.url{
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            //request.httpMethod = "POST"
            request.allHTTPHeaderFields = ["Content-Type":"Application/json"]
            
            request.httpBody = "username=ahmed".data(using: .utf8)
            
            let myData = ["username": "ahmed", "password": "123456"];
            if let data = try? JSONSerialization.data(withJSONObject: myData, options: .fragmentsAllowed) {
                request.httpBody = data
            }
            
            //Open session
            //Send Request -> with response parsing
            
            
            
        }
    }
    
}
