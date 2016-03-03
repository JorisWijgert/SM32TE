//
//  File.swift
//  testings
//
//  Created by Fhict on 26-02-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

// import Foundation


class Auto{
    var aantalWielen: Int
    var type: String
    
    init (aantalWielen: Int, type: String)
    {
        self.aantalWielen = aantalWielen
        self.type = type
    }
    
    func rijden() -> String
    {
        return "\(aantalWielen) \(type)"
    }
}