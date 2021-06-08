//
//  AuthorizationViewController.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 20.04.2021.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    private var authorizationService: AuthorizationService!

    override func viewDidLoad() {
        super.viewDidLoad()

        authorizationService = SceneDelegate.shared().authorizationService
    }
    
    @IBAction func signInTouch() {
        authorizationService.wakeUpSesssion()
    }
}
