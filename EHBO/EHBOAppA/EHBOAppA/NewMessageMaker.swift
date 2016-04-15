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
    @IBOutlet weak var ehboSwitch: UISwitch!
    @IBOutlet weak var aedSwitch: UISwitch!
    @IBOutlet weak var oneOneTwoSwitch: UISwitch!
    @IBOutlet weak var reanimaterSwitch: UISwitch!
    
    var locationManager: CLLocationManager = CLLocationManager()
    var latestLocation: CLLocation?
    
    required init?(coder aDecoder: NSCoder) {
        //super.init: (coder: NSCoder)
        super.init(coder: aDecoder)
        
    }
    
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
        latestLocation = locations[locations.count - 1]
        
        CLGeocoder().reverseGeocodeLocation(latestLocation!, completionHandler: {(placemarks, error) in
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
                }
            } else{
                self.locationString.text = "\(self.latestLocation!.coordinate.latitude), \(self.latestLocation!.coordinate.longitude)"
            }
        })
//        var loc:CLLocation?
//        var latati:CLLocationDegrees?
//        latati = 12.2
//        var longitu:CLLocationDegrees?
//        longitu = 12.1
//        loc = CLLocation(latitude: latati!, longitude: longitu!)
        
    }
    
    func locationManager(manager: CLLocationManager,
                         didFailWithError error: NSError) {
        locationString.text = "locatie is niet opgehaald"
    }

    @IBAction func makeNotify(sender: UIBarButtonItem) {
        let newNotify = Notify(title: "Ongeval " + self.locationString.text!, latitude: self.latestLocation!.coordinate.latitude, longitude: self.latestLocation!.coordinate.longitude, aed: self.aedSwitch.on, ehbo: self.ehboSwitch.on, reanimeerder: self.reanimaterSwitch.on, ambulance: self.oneOneTwoSwitch.on, active: true)
        AppManager.customNotifies.append(newNotify)
        
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("NavigationToIncidents")
        let controller:UINavigationController = (viewController as? UINavigationController)!
        self.presentViewController(controller, animated: true, completion: nil)
    }

}
