//
//  ResponseModel.swift
//  ContinueWorking
//
//  Created by Ahmed Qazzaz on 04/12/2021.
//

import Foundation


struct ResponseModel : Codable {
    var status : Bool
    var message : String
    var user : User?
    
    
    func json()->Data?{
        do{
            return try JSONEncoder().encode(self)
        }
        catch{
            print(error)
        }
        
        return nil
    }
    
    static func object(_ d: Data)->ResponseModel?{
        do{
            return try JSONDecoder().decode(ResponseModel.self, from: d)
        }catch{
            print(error)
        }
        return nil
    }
    
}


