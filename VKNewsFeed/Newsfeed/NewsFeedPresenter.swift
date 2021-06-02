//
//  NewsFeedPresenter.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 27.04.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsFeedPresentationLogic {
  func presentData(response: NewsFeed.Model.Response.ResponseType)
}

class NewsFeedPresenter: NewsFeedPresentationLogic {
  weak var viewController: NewsFeedDisplayLogic?
    let dateFormatter: DateFormatter = {
        let date = DateFormatter()
        date.locale = Locale(identifier: "ru_RU")
        date.dateFormat = "d MMM 'в' HH: mm"
        return date
    }()
  
  func presentData(response: NewsFeed.Model.Response.ResponseType) {
    
    switch response {
    case .presentNewsfeed(feed: let feed):
        let cells = feed.items.map { (feedItem) in
            cellViewModel(from: feedItem, profiles: feed.profiles, groups: feed.groups)
        }
        
        let feedViewModel = FeedViewModel.init(cells: cells)
        viewController?.displayData(viewModel: NewsFeed.Model.ViewModel.ViewModelData.displayNewsfeed(feedViewModel: feedViewModel))
    }
  
  }
    
    private func cellViewModel(from feedItem: FeedItem, profiles: [Profile], groups: [Group]) -> FeedViewModel.Cell {
        let profile = self.profile(for: feedItem.sourceId, profiles: profiles, groups: groups)
        
        let photoAttachments = self.photoAttachments(feedItem: feedItem)
        let date = Date(timeIntervalSince1970: feedItem.date)
        let dateTitle = dateFormatter.string(from: date)
        
        return FeedViewModel.Cell.init(iconUrlString: profile.photo,
                                       name: profile.name,
                                       date: dateTitle,
                                       text: feedItem.text,
                                       likes: String(feedItem.likes?.count ?? 0),
                                       comments: String(feedItem.comments?.count ?? 0),
                                       shares: String(feedItem.reposts?.count ?? 0 ),
                                       view: String(feedItem.views?.count ?? 0),
                                       photoAttachemets: photoAttachments)
    }
  
    private func profile(for sourseId: Int, profiles: [Profile], groups: [Group]) -> ProfileRepresenatable {
        let profilesOrGrops: [ProfileRepresenatable] = sourseId >= 0 ? profiles : groups
        let normalSourseId = sourseId >= 0 ? sourseId : -sourseId
        let profileRepresenatable  = profilesOrGrops.first { (myProfiResenatable) -> Bool in
            myProfiResenatable.id == normalSourseId
        }
        return profileRepresenatable!
    }
    
    private func photoAttachment(feedItem: FeedItem) -> FeedViewModel.FeedCellPhotoAttachment? {
        guard let photos = feedItem.attachments?.compactMap({ (attachment)  in
            attachment.photo
        }), let firstPhoto = photos.first else {
            return nil
        }
        return FeedViewModel.FeedCellPhotoAttachment.init(photoUrlString: firstPhoto.srcBIG, width: firstPhoto.width, height: firstPhoto.height)
    }
    
    private func photoAttachments(feedItem: FeedItem) -> [FeedViewModel.FeedCellPhotoAttachment] {
        guard let attachments = feedItem.attachments else { return [] }
        
        return attachments.compactMap { (attachment) -> FeedViewModel.FeedCellPhotoAttachment? in
            guard let photo = attachment.photo else { return nil }
            return FeedViewModel.FeedCellPhotoAttachment.init(photoUrlString: photo.srcBIG, width: photo.width, height: photo.height)
        }
    }
    
}
