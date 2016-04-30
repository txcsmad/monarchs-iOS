//
//  Network.swift
//  Monarchs
//
//  Created by Caroline Shi on 4/29/16.
//  Copyright © 2016 MadLabs. All rights reserved.
//

import Foundation

class Network {

    static var isLoggedin: Bool?
    static var currentUser: User?
    
    static func login(classCode: String, loginName: String, completionHandler: (Bool) -> Void) {
        //We authenticate here
        isLoggedin = true
        currentUser = User(classCode: classCode, loginName: loginName)
        completionHandler(isLoggedin!)
        
      
    }


}