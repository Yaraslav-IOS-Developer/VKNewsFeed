//
//  GallerycollectionView.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 24.06.2021.
//

import UIKit


class GalleryCollectionView: UICollectionView {
    
    private var photos = [FeedCellPhotoAttachementViewModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        
        backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func set(photos: [FeedCellPhotoAttachementViewModel]) {
        //self.photos = photos
    }
}



    //MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension GalleryCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId , for: indexPath) as! GalleryCollectionViewCell
        
        return cell
    }
    
    
}
