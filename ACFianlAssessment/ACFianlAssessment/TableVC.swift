//
//  TableVC.swift
//  ACFianlAssessment
//
//  Created by Leo on 8/4/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit
import CoreData

class TableVC: UIViewController, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    @IBOutlet weak var tableView: UITableView!
    var tempImage: UIImage?
    let refreshControl: UIRefreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        loadData()
        refreshControl.addTarget(self, action: #selector(TableVC.refresh), forControlEvents: .ValueChanged)
        self.tableView.addSubview(refreshControl)
    }
    
    func refresh() {
        loadData()
        refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPhoto(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .Camera
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func loadData() {
        do {
            let fetchRequest = NSFetchRequest(entityName: "Photo")
            let sortPhoto = NSSortDescriptor(key: "photoImage", ascending: false)
            let sortText = NSSortDescriptor(key: "photoText", ascending: false)
            fetchRequest.sortDescriptors = [sortPhoto, sortText]
            LocalDataBase.shareInstance.photoAlbum = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Photo]
//            let localPhoto = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Photo]
//            LocalDataBase.shareInstance.photoAlbum.insert(localPhoto, atIndex: 0)
            
            self.tableView.reloadData()
        } catch {
            print(error)
        }
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return LocalDataBase.shareInstance.photoAlbum.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("TVCell", forIndexPath: indexPath)
    cell.textLabel?.text = LocalDataBase.shareInstance.photoAlbum[indexPath.row].photoText
    let image = UIImage(data: LocalDataBase.shareInstance.photoAlbum[indexPath.row].photoImage!)
    cell.imageView?.image = image
//    
//    cell.imageView?.layer.cornerRadius = 10
//    cell.imageView?.layer.masksToBounds = true
    return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    
//    LocalDataBase.shareInstance.photoAlbum.removeAtIndex(indexPath.row)
//    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
        let photo = LocalDataBase.shareInstance.photoAlbum[indexPath.row]
        managedObjectContext.deleteObject(photo)
        appDelegate.saveContext()
        loadData()
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    
    // MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detailView" {
            let vc = segue.destinationViewController as! DetailVC
            vc.newImage = self.tempImage
        } else if segue.identifier == "checkView" {
            let vc = segue.destinationViewController as! CheckVC
            vc.index = self.tableView.indexPathForSelectedRow?.row
        }
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //print("info \(info)")
        let currentImage = info["UIImagePickerControllerOriginalImage"] as? UIImage
        self.dismissViewControllerAnimated(true, completion: {
            self.tempImage = currentImage
            self.performSegueWithIdentifier("detailView", sender: nil)
        })
    }
    
}

