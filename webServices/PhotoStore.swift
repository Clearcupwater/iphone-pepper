//
//  PhotoStore.swift
//  webServices
//
//  Created by Virtual on 6/23/17.
//  Copyright © 2017 Tadmin. All rights reserved.
//

import Foundation

enum photosResult {
    case sucess([Photo])
    case failure(Error)
    
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
    
    
    
    

}
