//
//  AboutViewController.swift
//  Assign2
//
//  Created by Fhict on 03-03-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import Foundation

import UIKit

class AboutViewController: UIViewController {
    @IBAction func btnEasterEgg(sender: AnyObject) {
        _ =
            UIAlertView(
                title: "Your txt is here:", message: "heyhalo", delegate: nil, cancelButtonTitle: "done!")
    }
    @IBOutlet weak var tfText: UITextField!
    
}