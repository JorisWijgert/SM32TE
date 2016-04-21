//
//  ViewController.swift
//  EHBOAppA
//
//  Created by Fhict on 08-04-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var Username: UITextField!

    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppManager.users.append(User(userName: "Stan", passWord: "Wulms", homeLocation: CLLocation(latitude: CLLocationDegrees(51.18484), longitude: CLLocationDegrees(5.128181))))
        AppManager.users.append(User(userName: "Joris", passWord: "Wijgert", homeLocation: CLLocation(latitude: CLLocationDegrees(51.18484), longitude: CLLocationDegrees(5.128181))))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // Login knop. Hier owrdt gecontroleerd op gebruikersnaam & Wachtwoord.
    @IBAction func logInAction(sender: AnyObject) {
        
        if(AppManager.checkUser(Username.text!, passWord: Password.text!) != nil){
            let preferences = NSUserDefaults.standardUserDefaults()
            let currentUserKey = "currentUser"
            let currentUser = Username.text!
            preferences.setValue(currentUser, forKeyPath: currentUserKey)
            let didSave = preferences.synchronize()
            if !didSave{
                errorMessage.hidden = false
                errorMessage.text = "Inloggegevens opslaan is mislukt"
            }
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("MainScreen")
            self.presentViewController(viewController, animated: true, completion: nil)
        } else{
            errorMessage.hidden = false
            errorMessage.text = "Gebruikersnaam of wachtwoord is niet correct"
        }
    }

}

