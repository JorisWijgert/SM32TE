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
    
    //Constructor voor de 'User' klasse.
    init(userName:String, passWord:String, homeLocation:CLLocation){
        self.userName = userName
        self.passWord = passWord
        self.homeLocation = homeLocation
    }
    
    //Methode om gebruikersnaam op te halen.
    func getUserName()->String{
        return self.userName
    }
    
    //Methode om wachtwoord op te halen.
    func getPassWord()->String{
        return self.passWord
    }
    
    //Methode om locatie op te halen.
    func getHomeLocation()->CLLocation{
        return self.homeLocation
    }
}