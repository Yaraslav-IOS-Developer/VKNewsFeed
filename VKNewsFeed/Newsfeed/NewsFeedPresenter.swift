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
  
  func presentData(response: NewsFeed.Model.Response.ResponseType) {
    
    switch response {
    case .some:
        print(".some Presenter")
    case .presentNewsfeed:
        print(".presentNewsfeed Presenter")
        viewController?.displayData(viewModel: .displayNewsfeed)
    }
  
  }
  
}
