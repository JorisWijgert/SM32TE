//
//  User.swift
//  EHBOAppA
//
//  Created by Fhict on 15-04-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import CoreLocation

class User{
    var userName:String=""
    var passWord:String=""
    var homeLocation:CLLocation
    
    init(userName:String, passWord:String, homeLocation:CLLocation){
        self.userName = userName
        self.passWord = passWord
        self.homeLocation = homeLocation
    }
    
    func getUserName()->String{
        return self.userName
    }
    
    func getPassWord()->String{
        return self.passWord
    }
    
    func getHomeLocation()->CLLocation{
        return self.homeLocation
    }
}