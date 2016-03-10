//
//  Pirate.swift
//  JSONWeek4
//
//  Created by Fhict on 10/03/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import Foundation
class Pirate {
    var name:String
    var life:String
    var yearsActive:String
    var countryOrigin:String
    var comments:String
    
    init(name:String, life:String, yearsActive:String, countryOrigin:String, comments:String) {
        self.name = name
        self.life = life
        self.yearsActive = yearsActive
        self.countryOrigin = countryOrigin
        self.comments = comments
    }
}