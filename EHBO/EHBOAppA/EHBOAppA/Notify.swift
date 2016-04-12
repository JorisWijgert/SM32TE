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
    var aed:Bool?
    var ehbo:Bool?
    var reanimeerder:Bool?
    var ambulance:Bool?
    var active:Bool?
    
    init(title:String, latitude:Double, longitude:Double, aed:Bool, ehbo:Bool, reanimeerder:Bool, ambulance:Bool, active:Bool) {
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
        self.aed = aed
        self.ehbo = ehbo
        self.reanimeerder = reanimeerder
        self.ambulance = ambulance
        self.active = active
    }

}
