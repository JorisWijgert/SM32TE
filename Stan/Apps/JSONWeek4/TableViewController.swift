//
//  TableViewController.swift
//  JSONWeek4
//
//  Created by Fhict on 10/03/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

//import Cocoa

class TableViewController: UITableViewController {

    var pirates = [Pirate]()
    
    func loadJsonData()
    {
        let url = NSURL(string: "http://athena.fhict.nl/users/i886625/pirates.json")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            do
            {
                if let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, 	   options: NSJSONReadingOptions.AllowFragments)
                {
                    self.parseJsonData(jsonObject)
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
                let newPirate = Pirate (
                    name: item.objectForKey("name") as! String,
                    life: item.objectForKey("life") as! String,
                    years_active: item.objectForKey("years_active") as! String,
                    country_of_origin: item.objectForKey("country_of_origin") as! String,
                    comments: item.objectForKey("comments") as! String
                )
                pirates.append(newPirate)
            }
        }
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadJsonData()
    }
}
