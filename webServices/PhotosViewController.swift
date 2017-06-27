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
                    if let firstPhoto = photos.first {
                        self.updateImageView(for: firstPhoto)
                }
                case let .failure(error):
                print("Error fetching interesting photos: \(error)")
            
            }
    }
    }
    
    func updateImageView (for photo: Photo) {
        store.fetchImage(for: photo) {(imageResult) -> Void in
            switch imageResult {
            case let .sucess(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error downloading image: \(error)")
                
            }
    
        }
    }
    
}
