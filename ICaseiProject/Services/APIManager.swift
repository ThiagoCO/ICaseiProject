//
//  APIManager.swift
//  ICaseiProject
//
//  Created by Thiago Cavalcante de Oliveira on 13/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {

    
    static let shared = APIManager()
    var apiKey = "AIzaSyDDzWD2u0UzxTNWfFNEDayVeQx09JvVW8I"
    
    func getListVideo(textSearch:String, pageToken:String? ,completed:@escaping(_ videoList:VideoList?) -> Void) {
        let url = (pageToken == nil) ? "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&order=viewCount&q=\(textSearch)&type=video&key=\(apiKey)" : "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&order=viewCount&pageToken=\(pageToken!)&q=\(textSearch)&type=video&key=\(apiKey)"
        
        Alamofire.request(url ,method: .get).responseData{ (result) in
            if let data = result.data {
                let videoList = try? JSONDecoder().decode(VideoList.self, from: data)
                completed(videoList)
            }
        }
    }
    
    func getVideoDetailStatistics(videoId:String, completed:@escaping(_ videoDetail:VideoDetailStatistics?) -> Void) {
        
        let url = "https://www.googleapis.com/youtube/v3/videos?id=\(videoId)&part=snippet,statistics&key=\(apiKey)"
        
        Alamofire.request(url, method: .get).responseData { (result) in
            if let data = result.data {
                let videoStatistics = try? JSONDecoder().decode(VideoDetailStatistics.self, from: data)
                completed(videoStatistics)
            }

        }
    }
   
}
