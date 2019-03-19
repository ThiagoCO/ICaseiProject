//
//  VideoDetailViewModel.swift
//  ICaseiProject
//
//  Created by Thiago Cavalcante de Oliveira on 17/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class VideoDetailViewModel {
    
    var view: DetailView
    var video: Video?
    
    init(view: DetailView, video: Video?) {
        self.view = view
        self.video = video
        self.getVideoDetailStatistics()
    }
    
    func getVideoDetailStatistics() {
        if let id = video?.id.videoId {
            APIManager.shared.getVideoDetailStatistics(videoId: id) { (videoStatistics) in
                if let videoDetail = self.video, let videoDetailStatistics = videoStatistics {
                    self.view.configure(video: videoDetail, videoStatistics: videoDetailStatistics)
                }
            }
        }
       
    }
}
