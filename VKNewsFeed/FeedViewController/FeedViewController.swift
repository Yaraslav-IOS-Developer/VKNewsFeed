//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 20.04.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkServise = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkServise.getFeed()
        view.backgroundColor = .systemBlue
    }
    
}
