//
//  Rowlayout.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 26.06.2021.
//

import UIKit

protocol RowLayoutDelegate: class {
    func collectionView(_ collectionView: UICollectionView, photoAtIndexPath indexPath: IndexPath) -> CGSize
}

class RowLayout: UICollectionViewLayout {
    
    weak var delegate: RowLayoutDelegate!
    
    fileprivate var numberOfRows = 1
    fileprivate var cellPadding: CGFloat = 8
    
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var contenWidth: CGFloat = 0
    fileprivate var contentHeight: CGFloat {
        guard let collectionView = collectionView else { return 0}
        
        let insets = collectionView.contentInset
        return collectionView.bounds.height - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contenWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard cache.isEmpty == true, let collectionView = collectionView else { return }
        
        var photos = [CGSize]()
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let photosize = delegate.collectionView(collectionView, photoAtIndexPath: indexPath)
            photos.append(photosize)
        }
        let superviewWidth = collectionView.frame.width
        guard let rowHeight = self.rowHeightCounter(superviewWidth: superviewWidth, photosArray: photos) else { return }
    }
    
    private func rowHeightCounter(superviewWidth: CGFloat, photosArray: [CGSize]) -> CGFloat? {
        var rowHeight: CGFloat
        
        let photoWithMinRation = photosArray.min { (first, second) -> Bool in
            (first.height / first.width) < (second.height / second.width)
        }
        guard let myPhotoWidthMinRation = photoWithMinRation else { return nil }
        
        let difference = superviewWidth / myPhotoWidthMinRation.width
        rowHeight = myPhotoWidthMinRation.height * difference
        return rowHeight
        
    }
}
