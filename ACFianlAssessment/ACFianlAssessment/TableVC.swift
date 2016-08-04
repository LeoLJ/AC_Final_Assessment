//
//  TableVC.swift
//  ACFianlAssessment
//
//  Created by Leo on 8/4/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class TableVC: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after varding the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPhoto(sender: AnyObject) {
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return LocalDataBase.shareInstance.photoAlbum.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("BookDetailCell", forIndexPath: indexPath)
    cell.textLabel?.text = LocalDataBase.shareInstance.photoAlbum[indexPath.row].photoName
    cell.imageView?.image = LocalDataBase.shareInstance.photoAlbum[indexPath.row].photoImage
    
    cell.imageView?.layer.cornerRadius = 10
    cell.imageView?.layer.masksToBounds = true
    return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//    if segue.identifier == "GoCheckingPage" {
//    let vc = segue.destinationViewController as! DetailOfBookVC
//    vc.index = listTableView.indexPathForSelectedRow?.row
//    }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    
    LocalDataBase.shareInstance.photoAlbum.removeAtIndex(indexPath.row)
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
