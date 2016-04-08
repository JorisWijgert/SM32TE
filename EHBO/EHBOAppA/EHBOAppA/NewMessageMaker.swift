//
//  NewMessageMaker.swift
//  EHBOAppA
//
//  Created by Fhict on 08-04-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import UIKit
import CoreLocation

class NewMessageMaker: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationString: UILabel!
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let latestLocation: CLLocation = locations[locations.count - 1]
        
        CLGeocoder().reverseGeocodeLocation(latestLocation, completionHandler: {(placemarks, error) in
            if (error != nil) {print("reverse failed")}
            if(placemarks != nil){
                let pm = placemarks! as [CLPlacemark]
                if pm.count > 0 {
                    let place = pm[0]
                    var addressString:String = ""
                    if place.thoroughfare != nil {
                        addressString = place.thoroughfare! + ", "
                    }
                    if place.locality != nil {
                        addressString = addressString + place.locality!
                    }

                    self.locationString.text = addressString
                }}})
        
    }
    
    func locationManager(manager: CLLocationManager,
                         didFailWithError error: NSError) {
        locationString.text = "locatie is niet opgehaald"
    }


}
