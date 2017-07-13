//
//  DarkSkyAPIClient.swift
//  Stormy
//
//  Created by Alyssia Higgs on 7/13/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
    fileprivate let apiKey = "adf6d57e36957e779d7db8b6585efef9"
    
    lazy var baseUrl: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!
        
    }()
    
    let downloader = JSONDownloader()
    
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, DarkSkyError?) -> Void
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, .invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = downloader.jsonTask(with: request) { json, error in
            guard let json = json else {
                completion(nil, error)
                return
            }
            
            guard let currentWeatherJson = json["currently"] as? [String: AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else {
                    completion(nil, .jsonParsingFailure)
                return
            }
            
            completion(currentWeather, nil)
        }
        
        task.resume()
    }

}
