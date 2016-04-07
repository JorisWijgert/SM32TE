//
//  ViewController.swift
//  CoreLocationTest
//
//  Created by Fhict on 07-04-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var distance: UILabel!

    @IBOutlet weak var latitude: UILabel!
    
    @IBOutlet weak var longitude: UILabel!
    
    @IBOutlet weak var horizontalAccuracy: UILabel!
    
    @IBOutlet weak var altitude: UILabel!
    
    @IBOutlet weak var verticalAccuracy: UILabel!
    
    @IBOutlet weak var placeString: UILabel!
   
    
    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil
    }
    
    @IBAction func resetDistance(sender: AnyObject) {
        startLocation = nil
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
                    addressString = place.thoroughfare! + " "
                }
                if place.subThoroughfare != nil {
                    addressString = addressString + place.subThoroughfare! + ", "
                }
                if place.postalCode != nil {
                    addressString = addressString + place.postalCode! + " "
                }
                if place.locality != nil {
                    addressString = addressString + place.locality! + "\nGemeente "
                }
                if place.subAdministrativeArea != nil {
                    addressString = addressString + place.subAdministrativeArea! + ", "
                }
                if place.administrativeArea != nil {
                    addressString = addressString + place.administrativeArea! + ", "
                }
                if place.country != nil {
                    addressString = addressString + place.country!
                }
                self.placeString.text = addressString
                }}})
        
        latitude.text = String(format: "%.4f",
                               latestLocation.coordinate.latitude)
        longitude.text = String(format: "%.4f",
                                latestLocation.coordinate.longitude)
        horizontalAccuracy.text = String(format: "%.4f",
                                         latestLocation.horizontalAccuracy)
        altitude.text = String(format: "%.4f",
                               latestLocation.altitude)
        verticalAccuracy.text = String(format: "%.4f",
                                       latestLocation.verticalAccuracy)

        
        
        if startLocation == nil {
            startLocation = latestLocation 
        }
        
        let distanceBetween: CLLocationDistance =
            latestLocation.distanceFromLocation(startLocation)
        
        distance.text = String(format: "%.2f", distanceBetween)
        
    }
    
    func locationManager(manager: CLLocationManager,
                         didFailWithError error: NSError) {
        
    }


}

