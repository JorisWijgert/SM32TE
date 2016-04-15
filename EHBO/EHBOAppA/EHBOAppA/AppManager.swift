//
//  AppManager.swift
//  EHBOAppA
//
//  Created by Fhict on 12-04-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import Foundation

class AppManager{
    internal static var notifies = [Notify]()
    internal static var users = [User]()
    
    internal static func checkUser(userName:String, passWord:String) -> (User)?{
        for user in users {
            if(user.userName == userName && user.passWord == passWord){
                return user
            }
        }
        return nil
    }
}