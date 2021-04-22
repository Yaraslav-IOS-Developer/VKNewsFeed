//
//  NetworkService.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 21.04.2021.
//

import Foundation


protocol Networking {
    func request(path: String, params: [String: String], completion: @escaping (Data?, Error?) -> Void)
}
class NetworkService: Networking {
    
    
    
    private let authorizationService: AuthorizationService
    
    init(authorizationService: AuthorizationService = SceneDelegate.shared().authorizationService) {
        self.authorizationService = authorizationService
    }
    
    func request(path: String, params: [String : String], completion: @escaping (Data?, Error?) -> Void) {
        guard let token = authorizationService.token else { return }
        let params = ["filters": "post, photo"]
        var allparams = params
        allparams["access_token"] = token
        allparams["v"] = API.versiom
        let url  = self.url(from: path, params: allparams)
        let requst = URLRequest(url: url)
        let task = createDataTask(from: requst, completion: completion)
        
        task.resume()
        print(url)
    }
   
    private func createDataTask(from requst: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        
        return URLSession.shared.dataTask(with: requst) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
    
    private func url(from path: String, params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.newsFeed
        components.queryItems = params.map{ URLQueryItem(name: $0, value: $1) }
        
        return components.url!
    }
}
