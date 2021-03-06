//
//  NewsfeedCell.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 28.04.2021.
//

import UIKit

protocol FeedCelllViewModel {
    var iconUrlString: String { get }
    var name: String { get }
    var date: String { get }
    var text: String? { get }
    var likes: String? { get }
    var comments: String? { get }
    var shares: String? { get }
    var view: String? { get }
    var photoAttachemets: [FeedCellPhotoAttachementViewModel] { get }
    var sizes: FeedCellSizes { get }
    
}

protocol FeedCellPhotoAttachementViewModel {
    var photoUrlString: String? { get }
    var width: Int { get }
    var height: Int { get }
}

protocol FeedCellSizes {
    var postLabelFrame: CGRect { get }
    var attachmentFrame: CGRect { get }
    var bottomViewFrame: CGRect { get }
    var totalHeight: CGFloat { get }
    var moreTextButtonFrame: CGRect { get }
}


class NewsfeedCell: UITableViewCell {
    
    static let reusedId = "NewsfeedCell"
    
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var iconImageView: WebImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var postLabel: UILabel!
    @IBOutlet private weak var postImageView: WebImageView!
    @IBOutlet private weak var likeLabel: UILabel!
    @IBOutlet private weak var commentsLabel: UILabel!
    @IBOutlet private weak var sharesLabel: UILabel!
    @IBOutlet private weak var viewsLabel: UILabel!
    @IBOutlet private weak var bottomView: UIView!
    
    
    override func prepareForReuse() {
        iconImageView.set(imageUrl: nil)
        postImageView.set(imageUrl: nil)
    }
    
    override func awakeFromNib() {
        superview?.awakeFromNib()
        
        iconImageView.layer.cornerRadius = iconImageView.frame.width / 2
        iconImageView.clipsToBounds = true
        
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        
    }
    
//    func configCell(viewModel: FeedCelllViewModel) {
//        iconImageView.set(imageUrl: viewModel.iconUrlString)
//        nameLabel.text = viewModel.name
//        dateLabel.text = viewModel.date
//        postLabel.text = viewModel.text
//        likeLabel.text = viewModel.likes
//        commentsLabel.text = viewModel.comments
//        sharesLabel.text = viewModel.shares
//        viewsLabel.text = viewModel.view
//        
//        postLabel.frame = viewModel.sizes.postLabelFrame
//        postImageView.frame = viewModel.sizes.attachmentFrame
//        bottomView.frame = viewModel.sizes.bottomViewFrame
//        
//        
//        
//        if let photoAttachment = viewModel.photoAttachemets {
//            postImageView.set(imageUrl: photoAttachment.photoUrlString )
//            postImageView.isHidden = false
//        } else {
//            postImageView.isHidden = true
//        }
//    }
    
}


