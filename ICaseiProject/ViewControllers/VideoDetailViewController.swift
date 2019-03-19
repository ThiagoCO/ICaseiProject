//
//  VideoDetailViewController.swift
//  ICaseiProject
//
//  Created by Thiago Cavalcante de Oliveira on 16/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class VideoDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageVideo: UIImageView!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var descriptionTextArea: UITextView!
    
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dislikeLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    var video: Video?
    var image: UIImage?
    var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    var viewModel: VideoDetailViewModel?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageVideo.image = image
        viewModel = VideoDetailViewModel(view: self, video: video)
    }
    
    @IBAction func backVideoDetail(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
