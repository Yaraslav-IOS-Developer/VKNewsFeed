//
//  NetworkService.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 21.04.2021.
//

import Foundation


class NetworkService {
    
    private let authorizationService: AuthorizationService
    
    init(authorizationService: AuthorizationService = SceneDelegate.shared().authorizationService) {
        self.authorizationService = authorizationService
    }
    
    func getFeed() {
        
        var components = URLComponents()
        
        //https://api.vk.com/method/users.get?user_ids=210700286&fields=bdate&access_token=533bacf01e11f55b536a565b57531ac114461ae8736d6506a3&v=5.130
        
        guard let token = authorizationService.token else { return }
        let params = ["filters": "post, photo"]
        var allparams = params
        allparams["access_token"] = token
        allparams["v"] = API.versiom
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.newsFeed
        components.queryItems = allparams.map{ URLQueryItem(name: $0, value: $1) }
        
        guard let url = components.url else { return }
        print(url)
    }
}
