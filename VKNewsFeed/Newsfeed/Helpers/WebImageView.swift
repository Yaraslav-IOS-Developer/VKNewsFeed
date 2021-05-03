//
//  WebImageView.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 30.04.2021.
//

import UIKit

class WebImageView: UIImageView {
    
    func set(imageUrl: String?) {
        guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else { return }
        
        if let chachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)){
            self.image = UIImage(data: chachedResponse.data)
            print("From cache")
            return
        }
        
        print("From internet")
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.image = UIImage(data: data)
                    self?.handleLoadeeImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    
    private func handleLoadeeImage(data: Data, response: URLResponse) {
        
        guard let responseUrl = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseUrl))
    }
  
    
}
