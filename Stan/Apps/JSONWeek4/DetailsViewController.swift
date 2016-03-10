//
//  DetailsViewController.swift
//  JSONWeek4
//
//  Created by Fhict on 10/03/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

//import Cocoa
import UIKit

class DetailsViewController: UIViewController {

    var selectedPirate: Pirate?
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbLife: UILabel!
    @IBOutlet weak var lbActiveYears: UILabel!
    @IBOutlet weak var lbCountryOfBirth: UILabel!
    @IBOutlet weak var tvComments: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.lbName.text = self.selectedPirate?.name
        self.lbLife.text = self.selectedPirate?.life
        self.lbActiveYears.text = self.selectedPirate?.yearsActive
        self.lbCountryOfBirth.text = self.selectedPirate?.countryOrigin
    }
}
