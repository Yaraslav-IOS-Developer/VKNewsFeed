//
//  NewsfeedCell.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 28.04.2021.
//

import UIKit


class NewsfeedCell: UITableViewCell {
    
    static let reusedId = "NewsfeedCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var sharedLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        superview?.awakeFromNib()
    }
}
