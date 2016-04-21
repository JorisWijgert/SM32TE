//
//  Notifies.swift
//  EHBOAppA
//
//  Created by Fhict on 12/04/16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import Foundation

class Notify {
    
    var title:String?
    var latitude:Double?
    var longitude:Double?
    var aed:AppManager.actionType?
    var ehbo:AppManager.actionType?
    var reanimeerder:AppManager.actionType?
    var ambulance:AppManager.actionType?
    var active:Bool?
    
    init(title:String, latitude:Double, longitude:Double, aed:AppManager.actionType, ehbo:AppManager.actionType, reanimeerder:AppManager.actionType, ambulance:AppManager.actionType, active:Bool) {
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
        self.aed = aed
        self.ehbo = ehbo
        self.reanimeerder = reanimeerder
        self.ambulance = ambulance
        self.active = active
    }
    
    init(notify:Notify) {
        self.title = notify.title
        self.latitude = notify.latitude
        self.longitude = notify.longitude
        self.aed = notify.aed
        self.ehbo = notify.ehbo
        self.reanimeerder = notify.reanimeerder
        self.ambulance = notify.ambulance
        self.active = notify.active
        
    }
    
    func getActive()->Bool{
        return self.active!
    }
    
    

}
