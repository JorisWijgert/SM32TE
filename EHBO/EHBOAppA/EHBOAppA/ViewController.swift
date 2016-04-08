//
//  ViewController.swift
//  EHBOAppA
//
//  Created by Fhict on 08-04-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Username: UITextField!

    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logInAction(sender: AnyObject) {
        if(Username.text!.characters.count > 3 && Password.text!.characters.count > 3){
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("MainScreen")
            self.presentViewController(viewController, animated: true, completion: nil)
        }
        else if(Username.text!.characters.count <= 3){
            errorMessage.hidden=false
            errorMessage.text = "Gebruikersnaam is te kort"
        }
        else if(Password.text!.characters.count <= 3){
            errorMessage.hidden = false
            errorMessage.text = "Wachtwoord is te kort"
        }
    }

}

