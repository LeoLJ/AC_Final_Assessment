//
//  LocalDataBase.swift
//  ACFianlAssessment
//
//  Created by Leo on 8/4/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class LocalDataBase: NSObject {
    
    let userDefault = NSUserDefaults.standardUserDefaults()
    
    static let shareInstance = LocalDataBase()
    
    let collectionListArray = ["AlertView", "ActionSheet", "Call 117", "OpenSetting", "Go AlphaCamp", "Send Mail"]
    var photoAlbum = [Photo]()
    
}

//class Photos {
//    
//    var photoName: String?
//    var photoImage: UIImage?
//    
//    init(photoName: String?, photoImage: UIImage?)
//    {
//        self.photoName = photoName
//        self.photoImage = photoImage
//    }
//}
