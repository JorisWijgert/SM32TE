//
//  TaskController.swift
//  AHBO
//
//  Created by Fhict on 21/04/16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import UIKit
import MapKit

class TaskController: UIViewController {

    var wissel: Int32?
    var lat: Double?
    var lon: Double?
    
    @IBOutlet weak var lblInformatie: UILabel!
    @IBOutlet weak var titleBar: UINavigationItem!
    @IBOutlet weak var mapLocation: MKMapView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        if wissel == 1 {
            lblInformatie.text = "Ga naar de plek van het ongeval. Zie het kaartje beneden voor de kortste route."
            titleBar.title = "Reanimeren"
        } else if wissel == 2 {
            lblInformatie.text = "Breng het EHBO kistje naar de plek van het ongeval. Zie het kaartje beneden voor de kortste route."
            titleBar.title = "EHBO kist"
        } else if wissel == 3 {
            lblInformatie.text = "Breng de AED naar de plek van het ongeval. Zie het kaartje beneden voor de kortste route."
            titleBar.title = "AED"
        }
        
        let request = MKDirectionsRequest()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: mapLocation.userLocation.coordinate, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocation(lat, lon), addressDictionary: nil))
        
    }
}