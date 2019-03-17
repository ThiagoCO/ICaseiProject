//
//  VideoCell.swift
//  ICaseiProject
//
//  Created by Thiago Cavalcante de Oliveira on 12/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit
import SDWebImage

class VideoCell: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func configure(video: VideoDetail?) {
        if let videoDetail = video {
            titleLabel.text = videoDetail.title
            channelLabel.text = videoDetail.channelTitle
            descriptionLabel.text = videoDetail.description
            videoImage.sd_setImage(with: videoDetail.thumbnails.image.url, completed: nil)
        }
      
    }
    
}
