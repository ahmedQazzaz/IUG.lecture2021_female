//
//  LoginService.swift
//  ContinueWorking
//
//  Created by Ahmed Qazzaz on 01/12/2021.
//

import UIKit


class AuthServices{
    
    func login(usingUsername u: String,
               andPassword p: String,
               atComplete handler: @escaping (_:ResponseModel?)->Void){
        
//        "http://google.com?a=123&p=123"
        
        var urlComponent = URLComponents(url: API.login.getURL(), resolvingAgainstBaseURL: false)
        urlComponent?.queryItems = [URLQueryItem(name: "username", value: u),
                                    URLQueryItem(name: "password", value: p)]
        
        if let url = urlComponent?.url{
            //http://google.com?a=12%203&b=456
            var request = URLRequest(url: url)
//            request.httpMethod = "POST"// GET // PUT // DELETE // PATCH
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = ["Content-Type":"application/json"]
            
//            request.httpBody = "username=ahmed".data(using: .utf8) //raw data
            
//            let myData = ["username": "ahmed", "password": "123456"]; // form data
//            if let data = try? JSONSerialization.data(withJSONObject: myData, options: .fragmentsAllowed) {
//                request.httpBody = data
//            }
            
            //Open session
            let session = URLSession.shared
                        
            //Send Request -> with response parsing
            let task = session.dataTask(with: request, completionHandler: { data, response, error in
                if let error = error {
                    print(error)
                }else{
                    if let data = data { //Data (binary)
                        let res = ResponseModel.object(data)
                        handler(res)
                    }
                }
            })
            
            task.resume() // << Send the request
        }
    }
    
}
