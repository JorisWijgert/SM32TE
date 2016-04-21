//
//  TableViewController.swift
//  EHBOAppA
//
//  Created by Fhict on 12/04/16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    func loadJsonData()
    {
        let url = NSURL(string: "http://athena.fhict.nl/users/i329146/JSON/notifies.json")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            do
            {
                if let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, 	   options: NSJSONReadingOptions.AllowFragments)
                {
                    self.parseJSONData(jsonObject)
                }
            }
            catch
            {
                print("Error parsing JSON data")
            }
        }
        dataTask.resume();
    }
    
    func parseJSONData(jsonObject:AnyObject) {
        AppManager.busyNotifies.removeAll()
        AppManager.nonBusyNotifies.removeAll()
        if let jsonData = jsonObject as? NSArray
        {
            for item in jsonData
            {
                let newNotify = Notify (
                    title: item.objectForKey("Title") as! String,
                    latitude: item.objectForKey("Latitude") as! Double,
                    longitude: item.objectForKey("Longitude") as! Double,
                    aed: AppManager.boolToActionType(item.objectForKey("AED") as! Bool),
                    ehbo: AppManager.boolToActionType(item.objectForKey("EHBO") as! Bool),
                    reanimeerder: AppManager.boolToActionType(item.objectForKey("Reanimeerder") as! Bool),
                    ambulance: AppManager.boolToActionType(item.objectForKey("Ambulance") as! Bool),
                    active: item.objectForKey("Active") as! Bool
                )
                if(newNotify.getActive()){
                    AppManager.busyNotifies.append(newNotify)
                } else{
                    AppManager.nonBusyNotifies.append(newNotify)
                }
            }
        }
        AppManager.busyNotifies.appendContentsOf(AppManager.customNotifies)
        self.tableView.reloadData()


    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadJsonData()
        sleep(1)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section:Int) -> String?{
        if section == 0{
            return "Hulp nodig"
        }
        else {
            return "Geen hulp meer nodig"
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        //Set the correct value in this cell
        //Do so by looking up the row in de indexpath and choosing the same element in the array
        if indexPath.section == 0{
            let currentNotify = AppManager.busyNotifies[indexPath.row]
            cell.textLabel?.text = currentNotify.title
            return cell;
        } else{
            let currentNotify = AppManager.nonBusyNotifies[indexPath.row]
            cell.textLabel?.text = currentNotify.title
            return cell;
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return AppManager.busyNotifies.count
        }
        else {
            return AppManager.nonBusyNotifies.count
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //Find the selected Notify
        let selectedRow = self.tableView.indexPathForSelectedRow
        let selectedNotify:Notify?
        if selectedRow?.section == 0 {
            selectedNotify = AppManager.busyNotifies[selectedRow!.row]
        }
        else{
            selectedNotify = AppManager.nonBusyNotifies[selectedRow!.row]
        }
        let controller = segue.destinationViewController as! NotifyViewController
        controller.selectedNotify = selectedNotify;
    }
    
    @IBAction func btnTerugClick(sender: UIBarButtonItem) {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("MainScreen")
        self.presentViewController(viewController, animated: true, completion: nil)
    }
}

