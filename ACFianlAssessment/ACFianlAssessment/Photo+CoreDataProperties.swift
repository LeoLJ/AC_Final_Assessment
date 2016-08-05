//
//  Photo+CoreDataProperties.swift
//  ACFianlAssessment
//
//  Created by Leo on 8/5/16.
//  Copyright © 2016 Leo. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Photo {

    @NSManaged var photoImage: NSData?
    @NSManaged var photoText: String?

}
