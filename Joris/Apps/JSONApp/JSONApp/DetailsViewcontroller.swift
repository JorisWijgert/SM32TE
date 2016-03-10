//
//  DetailsViewcontroller.swift
//  JSONApp
//
//  Created by Fhict on 10-03-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import UIKit

class DetailsViewcontroller: UIViewController {

    var selectedPirate: Pirate?
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbLife: UILabel!
    @IBOutlet weak var lbActiveYears: UILabel!
    @IBOutlet weak var lbCountryOfBirth: UILabel!
    @IBOutlet weak var lbComments: UITextView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.lbName.text = self.selectedPirate?.name
        self.lbLife.text = self.selectedPirate?.life
        self.lbActiveYears.text = self.selectedPirate?.yearsActive
        self.lbCountryOfBirth.text = self.selectedPirate?.countryOfOrigin
        self.lbComments.text = self.selectedPirate?.comments
    }
}
