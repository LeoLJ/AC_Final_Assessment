//
//  ViewController.swift
//  ACFianlAssessment
//
//  Created by Leo on 8/4/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        //MARK Q3 GET origin
        Alamofire.request(.GET, "https://httpbin.org/get").validate().responseJSON {
            response in
            switch response.result {
            case .Success:
                if let data = response.result.value {
                    let json = JSON(data)
                    NSLog(String(json["origin"]))
                }
            case .Failure(let error):
                print(error)
            }
        }
        
        //MARK Q3 POST
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
        let currentDate = formatter.stringFromDate(NSDate())
        let parameters = ["time":"\(currentDate)"]
        Alamofire.request(.POST, "https://httpbin.org/post", parameters: parameters).validate().responseJSON {
            response in
            switch response.result {
            case .Success:
                if let data = response.result.value {
                    let json = JSON(data)
                    let sendingTime = formatter.dateFromString(String(json["form"]["time"]))
                    let gap = NSString(format:"%.4f", -(sendingTime?.timeIntervalSinceNow)!)
                    NSLog("spent almost \(gap) sec" )
                }
            case .Failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

