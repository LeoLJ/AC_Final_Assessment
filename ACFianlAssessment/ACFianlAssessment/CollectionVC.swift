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
        case 0:
            print(0)
        case 1:
            print(1)
        case 2:
            print(2)
        case 3:
            print(3)
        case 4:
            print(4)
        case 5:
            print(5)
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
