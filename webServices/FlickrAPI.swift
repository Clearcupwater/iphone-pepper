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

struct FlickrAPI {
    
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let apiKey = "a6d819499131071f158fd740860a5a88"
    
    
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
    
    
}

