//
//  GlowAct.swift
//  testings
//
//  Created by Fhict on 03-03-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import Foundation

class GlowAct{
    
    var name:String
    var rating:Int
    var startTime:String
    
    init(name:String, rating:Int, startTime:String){
        self.name=name
        self.rating=rating
        self.startTime=startTime
    }
    
    func printLn(){
        print("The act is called \(name) and starts at \(startTime). It is given an average rating of \(rating)")

    }
    
}

class City {
    var name:String
    var population:Int
    var glowActs:[GlowAct]
    
    init(name:String, population:Int){
        self.name=name
        self.population=population
        self.glowActs = []
    }
    
    func println(){
        print("In the city of \(name) there are currently living \(population) people, there are \(glowActs.count) acts")
    }
}