//
//  TableViewController.swift
//  EHBOAppA
//
//  Created by Fhict on 12/04/16.
//  Copyright © 2016 Fontys. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    var notifies = [Notify]()
    
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
        if let jsonData = jsonObject as? NSArray
        {
            for item in jsonData
            {
                let newNotify = Notify (
                    title: item.objectForKey("Title") as! String,
                    latitude: item.objectForKey("Latitude") as! Double,
                    longitude: item.objectForKey("Longitude") as! Double,
                    aed: item.objectForKey("AED") as! Bool,
                    ehbo: item.objectForKey("EHBO") as! Bool,
                    reanimeerder: item.objectForKey("Reanimeerder") as! Bool,
                    ambulance: item.objectForKey("Ambulance") as! Bool,
                    active: true
                )
                notifies.append(newNotify)
            }
        }
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadJsonData()
        sleep(1)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        //Set the correct value in this cell
        //Do so by looking up the row in de indexpath and choosing the same element in the array
        let currentRow = indexPath.row;
        let currentNotify = self.notifies[currentRow]
        //Set the text in the cell
        cell.textLabel?.text = currentNotify.title
        return cell;
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifies.count
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //Find the selected Pirate
        let selectedRow = self.tableView.indexPathForSelectedRow
        let selectedNotify = self.notifies[selectedRow!.row]
        let controller = segue.destinationViewController as! DetailsViewController
        controller.selectedNotify = selectedNotify;
    }
    
    @IBAction func btnTerugClick(sender: UIBarButtonItem) {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("MainScreen")
        self.presentViewController(viewController, animated: true, completion: nil)
    }
}

