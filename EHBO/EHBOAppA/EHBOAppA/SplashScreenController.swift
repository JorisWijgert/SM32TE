//
//  SplashScreenController.swift
//  EHBOAppA
//
//  Created by Fhict on 15-04-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import UIKit
import CoreLocation

class SplashScreenController: UIViewController {
    // Twee gebruikers
    override func viewDidLoad() {
        super.viewDidLoad()
        AppManager.users.append(User(userName: "Stan", passWord: "Wulms", homeLocation: CLLocation(latitude: CLLocationDegrees(51.18484), longitude: CLLocationDegrees(5.128181))))
        AppManager.users.append(User(userName: "Joris", passWord: "Wijgert", homeLocation: CLLocation(latitude: CLLocationDegrees(51.18484), longitude: CLLocationDegrees(5.128181))))
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        autoLogin()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Functie die controleert of je ingelogd bent geweest. Zo ja, dan logt hij je automatisch in.
    func autoLogin(){
        let preferences = NSUserDefaults.standardUserDefaults()
        let currentUserKey = "currentUser"
        if preferences.objectForKey(currentUserKey) != nil {
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("MainScreen")
            self.presentViewController(viewController, animated: true, completion: nil)
        } else{
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("LoginScreen")
            self.presentViewController(viewController, animated: true, completion: nil)
        }
    }
    
    
}
