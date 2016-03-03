//
//  AboutViewController.swift
//  Glow2k15
//
//  Created by Fhict on 03/03/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import Foundation

import UIKit

class AboutViewController: UIViewController {
    
    @IBAction func btnEasterEgg(sender: AnyObject) {
        _ =
            UIAlertView(
                title: "Your txt is here:", message: tfText.text, delegate: nil, cancelButtonTitle: "done!")
    }
    @IBOutlet weak var tfText: UITextField!
}