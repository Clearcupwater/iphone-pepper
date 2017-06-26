//
//  PhotosViewController.swift
//  webServices
//
//  Created by Virtual on 6/23/17.
//  Copyright © 2017 Tadmin. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetchInterestingPhotos{(photosResult) -> Void in
            switch photosResult {
                case let .sucess(photos):
                    print("Sucessfully found \(photos.count) photos .")
                case let .failure(error):
                print("Error fetching interesting photos: \(error)")
            
            }
    }
    
    }
}
