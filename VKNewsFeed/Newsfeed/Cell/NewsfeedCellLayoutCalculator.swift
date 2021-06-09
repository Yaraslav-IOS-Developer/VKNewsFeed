//
//  NewsfeedCellLayoutCalculator.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 09.06.2021.
//

import UIKit

protocol FeedCellLayoutCalculatorProtocol {
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachementViewModel?) -> FeedCellSizes
}
struct Sizes: FeedCellSizes {
    
    
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
    var bottonView: CGRect
    var totalHeight: CGFloat
    
    
}

struct Constants {
    static let cardInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    static let topViewHeight: CGFloat = 41
    static let postLabelInsert = UIEdgeInsets(top: 8 + Constants.topViewHeight + 8 , left: 8, bottom: 8, right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
}

final class FeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {

    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }
    
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachementViewModel?) -> FeedCellSizes {
        
        let cardViewWidth = screenWidth - Constants.cardInsets.left - Constants.cardInsets.right
        
        //MARK: - Работа с postLabelFrame
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postLabelInsert.left, y: Constants.postLabelInsert.top), size: CGSize.zero)
        
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsert.left - Constants.postLabelInsert.right
            let height = text.height(width: width, font: Constants.postLabelFont)
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        
        return Sizes(postLabelFrame: postLabelFrame, attachmentFrame: CGRect.zero, bottonView: CGRect.zero, totalHeight: 300)
    }
}
