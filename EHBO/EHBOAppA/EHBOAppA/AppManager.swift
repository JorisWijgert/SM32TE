//
//  AppManager.swift
//  EHBOAppA
//
//  Created by Fhict on 12-04-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import Foundation

class AppManager{
    internal static var busyNotifies = [Notify]()
    internal static var nonBusyNotifies = [Notify]()
    internal static var customNotifies = [Notify]()
    internal static var users = [User]()
    
    // Checkt of de user bestaat.
    internal static func checkUser(userName:String, passWord:String) -> (User)?{
        for user in users {
            if(user.userName == userName && user.passWord == passWord){
                return user
            }
        }
        return nil
    }
    
    // Zet de bool om naar een ActionType (binnengekregen van JSON)
    internal static func boolToActionType(inputBoolean: Bool) -> AppManager.actionType{
        if (inputBoolean){
            let randInt = arc4random_uniform(2)
            if randInt == 0 {
                return AppManager.actionType.Done
            }
            else{
                return AppManager.actionType.ToDo
            }
        } else{
            return AppManager.actionType.NoNeed
        }
    }
    
    internal enum actionType {case ToDo, Done, NoNeed}
}