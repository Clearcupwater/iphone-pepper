//
//  Photo+CoreDataProperties.swift
//  Photorama
//
//  Created by Virtual on 7/20/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var photoID: String?
    @NSManaged public var title: String?
    @NSManaged public var dateTaken: NSDate?
    @NSManaged public var remoteUrl: NSURL?

}
