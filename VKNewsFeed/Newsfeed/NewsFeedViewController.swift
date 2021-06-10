//
//  NewsFeedViewController.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 27.04.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsFeedDisplayLogic: class {
  func displayData(viewModel: NewsFeed.Model.ViewModel.ViewModelData)
}

class NewsFeedViewController: UIViewController, NewsFeedDisplayLogic {
    
  var interactor: NewsFeedBusinessLogic?
  var router: (NSObjectProtocol & NewsFeedRoutingLogic)?
    
    private var feedViewModel = FeedViewModel.init(cells: [])

    @IBOutlet weak var tableViewController: UITableView!
    
    
  // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = NewsFeedInteractor()
    let presenter             = NewsFeedPresenter()
    let router                = NewsFeedRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    //tableViewController.register(UINib(nibName: "NewsfeedCell", bundle: nil), forCellReuseIdentifier: NewsfeedCell.reusedId)
    tableViewController.register(NewsFeedCodeCell.self, forCellReuseIdentifier: NewsFeedCodeCell.reusedId)
    
   tableViewController.separatorStyle = .none
    interactor?.makeRequest(request: NewsFeed.Model.Request.RequestType.getNewsfeed)
  }
  
  func displayData(viewModel: NewsFeed.Model.ViewModel.ViewModelData) {
    
    switch viewModel {
    case .displayNewsfeed(feedViewModel: let feedViewModel):
        self.feedViewModel = feedViewModel
        tableViewController.reloadData()
    }

  }
  
}

extension NewsFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedViewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedCodeCell.reusedId, for: indexPath) as! NewsFeedCodeCell
        let cellViewModel = feedViewModel.cells[indexPath.row]
        cell.configCell(viewModel: cellViewModel)

        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellViewModel = feedViewModel.cells[indexPath.row]
        return cellViewModel.sizes.totalHeight
        
    }
    
}
