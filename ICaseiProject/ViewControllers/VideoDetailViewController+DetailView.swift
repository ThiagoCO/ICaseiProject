//
//  VideoDetailViewController+DetailView.swift
//  ICaseiProject
//
//  Created by Thiago Cavalcante de Oliveira on 17/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

protocol DetailView {
    func stopLoad()
    func startLoad()
    func configure(video: Video, videoStatistics:VideoDetailStatistics)
}

extension VideoDetailViewController: DetailView {
    func stopLoad() {
        activityIndicator.removeFromSuperview()
    }
    
    func startLoad() {
        self.view.addSubview(activityIndicator)
        activityIndicator.frame = self.view.frame
        activityIndicator.startAnimating()
    }
    
    func configure(video: Video, videoStatistics:VideoDetailStatistics) {
        titleLabel.text = video.snippet.title
        imageVideo.image = image
        channelLabel.text = video.snippet.channelTitle
        likeLabel.text = videoStatistics.items[0].statistics.likeCount.formatNumber()
        dislikeLabel.text = videoStatistics.items[0].statistics.dislikeCount.formatNumber()
        viewsLabel.text =  videoStatistics.items[0].statistics.viewCount.formatNumber()
        descriptionTextArea.text = video.snippet.description
    }
}
