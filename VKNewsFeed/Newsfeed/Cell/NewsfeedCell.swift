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
    
    
}

protocol FeedCellPhotoAttachementViewModel {
    var photoUrlString: String? { get }
    var width: Int { get }
    var height: Int { get }
}


class NewsfeedCell: UITableViewCell {
    
    static let reusedId = "NewsfeedCell"
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var iconImageView: WebImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var postImageView: WebImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        superview?.awakeFromNib()
        
        iconImageView.layer.cornerRadius = iconImageView.frame.width / 2
        iconImageView.clipsToBounds = true
        
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        
        
 
    }
    
    
    func configCell(viewModel: FeedCelllViewModel) {
        iconImageView.set(imageUrl: viewModel.iconUrlString)
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        likeLabel.text = viewModel.likes
        commentsLabel.text = viewModel.comments
        sharesLabel.text = viewModel.shares
        viewsLabel.text = viewModel.view
        
        
        if let photoAttachment  = viewModel.photoAttachemets.first, viewModel.photoAttachemets.count == 1 {
            postImageView.set(imageUrl: photoAttachment.photoUrlString)
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }
        
//        if let photoAttachment = viewModel.photoAttachemets {
//            postImageView.set(imageUrl: photoAttachment.photoUrlString)
//            postImageView.isHidden = false
//        } else {
//            postImageView.isHidden = true
//        }
//
//
    }
    
}
