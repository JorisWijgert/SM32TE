//
//  main.swift
//  HellGlow World
//
//  Created by Fhict on 03/03/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import Foundation

print("HellGlow, World!")

var GlowActBlue = GlowAct(name: "The Bluelight Act", rating: 8, startTime: "22:20")
GlowActBlue.showInfo()

var GlowActYellow = GlowAct(name: "The YellowLight Act", rating: 9, startTime: "21:45")

var myCity = City(name: "Eindhoven", population: 22000, glowActs: [GlowActBlue])
myCity.glowActs.append(GlowActYellow)
myCity.showInfo()

