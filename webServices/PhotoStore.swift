//
//  PhotoStore.swift
//  webServices
//
//  Created by Virtual on 6/23/17.
//  Copyright © 2017 Tadmin. All rights reserved.
//

import UIKit

enum photosResult {
    case sucess([Photo])
    case failure(Error)
    
}

enum ImageResult {
    case sucess(UIImage)
    case failure(Error)
}

enum PhotoError: Error {
    case imageCreationError
}

class PhotoStore {
    
    private let  session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
        
    }()
    
    func fetchInterestingPhotos(completion: @escaping (photosResult)-> Void) {
        let url = FlickrAPI.interestingPhotosURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {(data, response, error) -> Void in
            let result = self.processPhotoRequest(data: data, error: error)
            completion(result)
            print("Function Completed")
            print(result)
        }
            task.resume()
    }
    private func processPhotoRequest(data: Data?, error: Error?) -> photosResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        return FlickrAPI.photos(fromJSON: jsonData)
        
    }
    
    func fetchImage(for photo: Photo, completion: @escaping (ImageResult) -> Void) {
        let photoUrl = photo.remoteURL
        let request = URLRequest(url: photoUrl)
        
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            let result = self.processImageRequest(data: data, error: error)
                completion(result)
            
        }
        task.resume()
        
    }
    
    
    private func processImageRequest(data: Data?, error: Error?)-> ImageResult {
        guard
            let imageData = data,
            let image = UIImage(data: imageData) else {
                if data == nil {
                    return .failure(error!)
                } else {
                    return .failure(PhotoError.imageCreationError)
                }
            }
        
         return .sucess(image)
            
        }
        
        
    
    
    

}
