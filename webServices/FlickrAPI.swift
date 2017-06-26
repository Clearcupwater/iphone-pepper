//
//  FlickrAPI.swift
//  webServices
//
//  Created by Virtual on 6/23/17.
//  Copyright © 2017 Tadmin. All rights reserved.
//

import Foundation


enum Method: String {
    case interestingPhotos = "flickr.interestingness.getList"
    
}

enum FlickrError: Error {
    case invalidJSONData
}

struct FlickrAPI {
    
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let apiKey = "a6d819499131071f158fd740860a5a88"
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    
    private static func flickrURL(method: Method, parameter: [String:String]?) -> URL {
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParms = [
            "method": method.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key" : apiKey
        ]
        
        for (key, value) in baseParms {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        
        if let additionalParms = parameter {
            for (key, value) in additionalParms {
                let item = URLQueryItem(name:key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        
        return components.url!
        
    }
    
    
    static var interestingPhotosURL: URL {
        return flickrURL(method: .interestingPhotos, parameter: ["extras": "url_h,date_take"])
        
    }
    
    static func photos (fromJSON data: Data)-> photosResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard
            let jsonDictionary = jsonObject as? [AnyHashable: Any],
            let photos = jsonDictionary["photos"] as? [String: Any],
            let photosArray = photos["photo"] as? [[String:Any]] else {
                return .failure(FlickrError.invalidJSONData)
            }
            
            
            var finalPhotos = [Photo]()
            
            for photoJSON in photosArray {
                if let photo = photo(fromJSON: photoJSON) {
                    finalPhotos.append(photo)
                }
            }
            
            if finalPhotos.isEmpty && !photosArray.isEmpty {
                return .failure(FlickrError.invalidJSONData)
            
            }
            
            
            
            
            
            
            return .sucess(finalPhotos)
            
        } catch let error {
            return .failure(error)
        }
        
    }
    
    
    private static func photo(fromJSON json: [String : Any])-> Photo? {
        guard
            let photoID = json["id"] as? String,
            let title = json["title"] as? String,
            let dateString = json["datetaken"] as? String,
            let photoURLString = json["url_h"] as? String,
            let url = URL(string: photoURLString),
            let dateTaken = dateFormatter.date(from:dateString) else {
                return nil
        }
        return (Photo(title: title, photoID: photoID, remoteURL: url, dateTaken: dateTaken))
        
    }
    
    
}

