//
//  NewsFeedModels.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 27.04.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum NewsFeed {
    
    enum Model {
        struct Request {
            enum RequestType {
                case getNewsfeed
            }
        }
        struct Response {
            enum ResponseType {
                case presentNewsfeed(feed: FeedResponse)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayNewsfeed(feedViewModel: FeedViewModel)
            }
        }
    }
}

struct FeedViewModel {
    struct Cell: FeedCelllViewModel {
        
        
        var iconUrlString: String
        var name: String
        var date: String
        var text: String?
        var likes: String?
        var comments: String?
        var shares: String?
        var view: String?
        var photoAttachemets: FeedCellPhotoAttachementViewModel?
        var sizes: FeedCellSizes
        
    }
    
    struct FeedCellPhotoAttachment: FeedCellPhotoAttachementViewModel {
        var photoUrlString: String?
        var width: Int
        var height: Int
        
        
    }
    let cells: [Cell]
}
