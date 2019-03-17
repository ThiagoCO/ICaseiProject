//
//  HomeViewModel.swift
//  ICaseiProject
//
//  Created by Thiago Cavalcante de Oliveira on 13/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    var videoList: [Video]?
    var nextPage: String?
    var searchText: String?
    var view: HomeView
    init(view:HomeView) {
        self.view = view
    }
    
    func getVideoList(textSearch: String?) {
        view.startLoad()
        guard let text = textSearch else { return }
        
        let textFormat = text.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        
        APIManager.shared.getListVideo(textSearch: textFormat, pageToken: nextPage) { (videoList) in
            if(self.nextPage != nil) {
                if let videos = videoList?.items {
                    for video in videos{
                        self.videoList?.append(video)
                    }
                }
            }
            else {
                self.videoList = videoList?.items
                self.view.createTable()
            }
            self.nextPage = videoList?.nextPageToken
            self.searchText = textSearch
            self.view.stopLoad()
            self.view.reloadTableView()
            
        }
    }
    
    
    func getNextVideos(index:Int) {
        if(nextPage != nil && videoList?.count == (index + 1))
        {
            getVideoList(textSearch: searchText)
        }
    }
}
