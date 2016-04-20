//
//  NotifyViewController.swift
//  EHBOAppA
//
//  Created by Fhict on 18-04-16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import UIKit

class NotifyViewController: UIViewController {
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    
    var selectedNotify: Notify?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.navItem.title = selectedNotify?.title
    }
    
}
