//
//  City.swift
//  HellGlow World
//
//  Created by Fhict on 03/03/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import Foundation

class City {
    var name:String = ""
    var population:Int = 0
    var glowActs: [GlowAct] = []
    
    init(name:String, population:Int, glowActs:[GlowAct])
    {
        self.name = name
        self.population = population
        self.glowActs = glowActs
    }
    
    func showInfo() {
        print("In the city of \(name) there are currently living \(population) people. \nNumber of Glows: \(glowActs.count)")
        for GlowAct in glowActs {
            GlowAct.showInfo()
        }
    }
}