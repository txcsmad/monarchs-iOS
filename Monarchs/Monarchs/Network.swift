//
//  Network.swift
//  Monarchs
//
//  Created by Caroline Shi on 4/29/16.
//  Copyright © 2016 MadLabs. All rights reserved.
//

import Foundation

class Network {

    //By default user is not logged in 
    static var isLoggedin: Bool? = false
    static var currentUser: User?
    
    static func login(classCode: String, loginName: String, completionHandler: (Bool) -> Void) {
        //We authenticate here
        isLoggedin = true
        currentUser = User(classCode: classCode, loginName: loginName)
        completionHandler(isLoggedin!)
        
      
    }
    
    static func loggedIn() -> Bool! {
        return isLoggedin!
    }


}