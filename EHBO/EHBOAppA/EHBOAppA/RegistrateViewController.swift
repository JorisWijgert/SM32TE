//
//  RegistrateViewController.swift
//  AHBO
//
//  Created by Fhict on 21-04-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import UIKit
import CoreLocation

class RegistrateViewController: UIViewController {

    
    @IBOutlet weak var lblErrorMessage: UILabel!
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfPassWord: UITextField!
    
    @IBAction func RegistrateAction(sender: AnyObject) {
        if tfUserName.text?.characters.count <= 0 {
            lblErrorMessage.hidden = false
            lblErrorMessage.text = "Geen gebruikersnaam ingevuld"
        }
        else if tfPassWord.text?.characters.count <= 0 {
            lblErrorMessage.hidden = false
            lblErrorMessage.text = "Geen wachtwoord ingevuld"
        }
        else if tfUserName.text?.characters.count > 0 && tfPassWord.text?.characters.count > 0 {
            AppManager.users.append(User(userName: tfUserName.text!, passWord: tfPassWord.text!, homeLocation: CLLocation(latitude: 51.12228, longitude: 5.1991)))
            let preferences = NSUserDefaults.standardUserDefaults()
            let currentUserKey = "currentUser"
            let currentUser = tfUserName.text!
            preferences.setValue(currentUser, forKeyPath:currentUserKey)
            let didSave = preferences.synchronize()
            if !didSave{
                lblErrorMessage.hidden = false
                lblErrorMessage.text = "Inloggegevens opslaan is mislukt"
            }
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("MainScreen")
            self.presentViewController(viewController, animated: true, completion: nil)
        }
    }
}
