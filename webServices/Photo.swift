//
//  Photo.swift
//  webServices
//
//  Created by Virtual on 6/23/17.
//  Copyright © 2017 Tadmin. All rights reserved.
//

import Foundation

class Photo {
    let title : String
    let remoteURL: URL
    let photoId: String
    let dateTaken: Date
    
    
    init(title:String, photoID: String, remoteURL: URL, dateTaken:Date){
        
        self.title = title
        self.photoId = photoID
        self.remoteURL = remoteURL
        self.dateTaken = dateTaken
        
    }
    
    
    
    
    
}
