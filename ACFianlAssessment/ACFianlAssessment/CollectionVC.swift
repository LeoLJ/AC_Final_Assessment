//
//  CollectionVC.swift
//  ACFianlAssessment
//
//  Created by Leo on 8/4/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        let spaceWidth = CGFloat(20)
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = (CGFloat(UIScreen.mainScreen().bounds.width) - CGFloat(spaceWidth * 3)) / 2
        let height = (CGFloat(UIScreen.mainScreen().bounds.height) - CGFloat(spaceWidth * 4)) / 3
        layout.itemSize = CGSize(width: width, height: height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LocalDataBase.shareInstance.collectionListArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CVCell", forIndexPath: indexPath) as! CVCell
        cell.cvCellLabel.text = LocalDataBase.shareInstance.collectionListArray[indexPath.row]
        cell.backgroundColor = UIColor.whiteColor()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0://Alert View
            let alert = UIAlertController(title: "Oops", message: "oh", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        case 1://Action Sheet
            let alert = UIAlertController(title: "Oops", message: "yo", preferredStyle: .ActionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        case 2://Call 117
            if let url = NSURL(string: "tel://117)") {
                UIApplication.sharedApplication().openURL(url)
            }
        case 3://open setting
            let setting = NSURL(string: UIApplicationOpenSettingsURLString)
            UIApplication.sharedApplication().openURL(setting!)
        case 4://apple map
            let encodedName = "104台北市中山區南京東路二段97號".stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())
            let path = "http://maps.apple.com/?q=" + encodedName!
            if let url = NSURL(string: path) {
                UIApplication.sharedApplication().openURL(url)
            } else {
                print("got some error")
            }
        case 5:
            let mail = "mailto:?subject=Testings%20Mail!&body=Just%20for%20test"
            if let url = NSURL(string: mail) {
                UIApplication.sharedApplication().openURL(url)
            }
        default:
            break
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
