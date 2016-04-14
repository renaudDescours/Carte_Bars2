//
//  BarTableViewController.swift
//  Carte Bars
//
//  Created by Renaud Descours on 08/04/2016.
//  Copyright © 2016 Renaud Descours. All rights reserved.
//

import UIKit

class BarTableViewController: UITableViewController {

    // MARK: Properties
    var bars = [Bar]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadBars()
        
    }
    
    // get bar's list from AppDelegate
    func loadBars(){
        let del = UIApplication.sharedApplication().delegate as! AppDelegate
        bars = del.bars
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bars.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BarTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BarTableViewCell
        let bar = bars[indexPath.row]
        bar.setPhoto()
        cell.nameLabel.text=bar.name
        cell.adressLabel.text=bar.adress
        cell.photoImageView.image=bar.photo
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // Proparation for openning the mapView with 1 bar selected
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="ShowDetail"{
            let barDetailViewController = segue.destinationViewController as! BarViewController
            
            // Get the cell that generated this segue.
            if let selectedBarCell = sender as? BarTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedBarCell)!
                let selectedBar = bars[indexPath.row]
                barDetailViewController.bars = [selectedBar]
            }
        }
    }
    

}
