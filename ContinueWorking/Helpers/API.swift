//
//  API.swift
//  ContinueWorking
//
//  Created by Ahmed Qazzaz on 08/12/2021.
//

import Foundation


enum API : String{
    
    static var basicURL = URL(string: "http://10.2.197.172:8080")!
    
    case login = "api/login"
    case updateUser = "api/saveUser"
    
    func getURL()->URL{
        return API.basicURL.appendingPathComponent(self.rawValue)
    }
        
}



