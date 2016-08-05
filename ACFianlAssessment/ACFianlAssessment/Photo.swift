//
//  Photo.swift
//  ACFianlAssessment
//
//  Created by Leo on 8/5/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import Foundation
import CoreData


class Photo: NSManagedObject {
    
    
    // modeled property
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        self.creationDate = NSDate()
    }

// Insert code here to add functionality to your managed object subclass

}
