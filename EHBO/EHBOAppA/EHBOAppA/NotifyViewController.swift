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
    @IBOutlet weak var btnCall: UIButton!
    @IBOutlet weak var btnReanimate: UIButton!
    @IBOutlet weak var btnEHBO: UIButton!
    @IBOutlet weak var btnAED: UIButton!
    @IBOutlet weak var viewCall: UIView!
    @IBOutlet weak var viewReanimate: UIView!
    @IBOutlet weak var viewEHBO: UIView!
    @IBOutlet weak var viewAED: UIView!
    
    var selectedNotify: Notify?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.navItem.title = selectedNotify?.title
        if (selectedNotify?.ambulance == AppManager.actionType.NoNeed){
            viewCall.hidden = true
        } else if (selectedNotify?.ambulance == AppManager.actionType.Done){
            btnCall.enabled = false
        }
        
        if (selectedNotify?.reanimeerder == AppManager.actionType.NoNeed){
            viewReanimate.hidden = true
        } else if (selectedNotify?.reanimeerder == AppManager.actionType.Done){
            btnReanimate.setTitle("Uitgevoerd", forState: .Normal)
            btnReanimate.enabled = false
        }
        
        if (selectedNotify?.ehbo == AppManager.actionType.NoNeed){
            viewEHBO.hidden = true
        } else if (selectedNotify?.ehbo == AppManager.actionType.Done){
            btnEHBO.setTitle("Uitgevoerd", forState: .Normal)
            btnEHBO.enabled = false
        }
        
        if (selectedNotify?.aed == AppManager.actionType.NoNeed){
            viewAED.hidden = true
        } else if (selectedNotify?.aed == AppManager.actionType.Done){
            btnAED.setTitle("Uitgevoerd", forState: .Normal)
            btnAED.enabled = false
        }
    }
    @IBAction func CallAction(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://0612345678")!)
    }
    
}
