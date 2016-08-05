//
//  CheckVC.swift
//  ACFianlAssessment
//
//  Created by Leo on 8/5/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class CheckVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    var index: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        self.scrollView.maximumZoomScale = 5.0
        self.scrollView.minimumZoomScale = 1.1
        self.checkImageView.image = LocalDataBase.shareInstance.photoAlbum[index!].photoImage
        self.textLabel.text = LocalDataBase.shareInstance.photoAlbum[index!].photoName
        // Do any additional setup after loading the view.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.checkImageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
