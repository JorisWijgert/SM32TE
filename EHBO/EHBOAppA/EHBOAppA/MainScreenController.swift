//
//  MainScreenController.swift
//  EHBOAppA
//
//  Created by Fhict on 15-04-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import UIKit

class MainScreenController: UIViewController {
    @IBOutlet weak var welcomeMessage: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let preferences = NSUserDefaults.standardUserDefaults()
        let currentUserKey = "currentUser"
        if preferences.objectForKey(currentUserKey) != nil {
            welcomeMessage.title = "Welkom \(preferences.objectForKey(currentUserKey)!)"
        }
    }
    
    //Knop methode om uit te loggen.
    @IBAction func logOut(sender: UIBarButtonItem) {
        let preferences = NSUserDefaults.standardUserDefaults()
        let currentUserKey = "currentUser"
        preferences.removeObjectForKey(currentUserKey)
        preferences.synchronize()
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("LoginScreen")
        self.presentViewController(viewController, animated: true, completion: nil)
    }
}
