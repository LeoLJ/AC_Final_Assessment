//
//  DetailVC.swift
//  ACFianlAssessment
//
//  Created by Leo on 8/5/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var currentImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    var newImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentImageView.image = newImage
        textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        animateViewMoving(true, moveValue: 130)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        animateViewMoving(false, moveValue: 130)
    }
    
    // Lifting the view up
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:NSTimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }
    
    override func willMoveToParentViewController(parent: UIViewController?) {
        if parent == nil {
            let currentDate = Photo(photoName: textField.text, photoImage: newImage)
            LocalDataBase.shareInstance.photoAlbum.insert(currentDate, atIndex: 0)
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
