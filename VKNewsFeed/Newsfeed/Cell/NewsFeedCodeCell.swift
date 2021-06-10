//
//  NewsFeedCodeCell.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 10.06.2021.
//

import UIKit



final class NewsFeedCodeCell: UITableViewCell {
    
    static let reusedId = "NewsFeedCodeCell"
    
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9385217428, green: 0.9559406638, blue: 0.9811115861, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        return view
    }()
    
    let postLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        label.font = Constants.postLabelFont
        
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let postImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return imageView
    }()
    
    let bottomView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        overlayFirstLayer() // Первый слой
        overlaySecondLayer() // Второй слой
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(viewModel: FeedCelllViewModel) {
        
        postLabel.frame = viewModel.sizes.postLabelFrame
        postImageView.frame = viewModel.sizes.attachmentFrame
        bottomView.frame = viewModel.sizes.bottomViewFrame
        
        
        
        if let photoAttachment = viewModel.photoAttachemets {
            //postImageView.set(imageUrl: photoAttachment.photoUrlString )
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }
    }
    
    
    func overlayFirstLayer() {
        addSubview(cardView)
        // cardView constraints
        cardView.fillSuperview(padding: Constants.cardInsets)
    }
    
    func overlaySecondLayer() {
        cardView.addSubview(topView)
        cardView.addSubview(postLabel)
        cardView.addSubview(postImageView)
        cardView.addSubview(bottomView)
        
        // topView constraints
        topView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8).isActive = true
        topView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8).isActive = true
        topView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8).isActive = true
        topView.heightAnchor.constraint(equalToConstant: Constants.topViewHeight).isActive = true
        
        // postLabel constraints
        
        
        // postImageView constraints
        
        
        
        
        // bottomView constraints
        
        
        
    }
}
