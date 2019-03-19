//
//  Video.swift
//  ICaseiProject
//
//  Created by Thiago Cavalcante de Oliveira on 13/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

struct VideoList: Codable {
    var nextPageToken: String
    var items: [Video]?
}

struct Video : Codable {
    var id: VideoId
    var snippet: VideoDetail
}

struct VideoId: Codable {
    var videoId: String
}

struct VideoDetail: Codable{
    var title:String
    var description: String
    var thumbnails: Thumbnails
    var channelTitle: String
}

struct Thumbnails: Codable {
    enum CodingKeys: String, CodingKey {
        case image = "high"
    }
    var image: Thumbnail
}

struct Thumbnail: Codable {
    var url: URL
}

struct VideoDetailStatistics: Codable {
    var items: [DetailStatistics]
}

struct DetailStatistics: Codable {
    var statistics: Statistics
}

struct Statistics: Codable {
    var viewCount: String
    var likeCount: String
    var dislikeCount: String
}
