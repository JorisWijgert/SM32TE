//
//  main.swift
//  testings
//
//  Created by Fhict on 26-02-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import Foundation

var blueLightAct = GlowAct(name: "The Bluelight Act", rating: 8, startTime: "22:20")

blueLightAct.printLn()

var oploo = City(name: "Oploo", population: 1806)

oploo.println()
oploo.glowActs.append(blueLightAct)
oploo.println()