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
        return view
    }()
    
    let postLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
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
        return view
    }()
    
    let iconImageView: WebImageView = {
       let image = WebImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5058823529, green: 0.5490196078, blue: 0.6, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let likesView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    let commentsView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    let sharesView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    let viewsView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    let likesImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "like")
        return imageView
    }()
    
    let commentsImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "comment")
        return imageView
    }()
    
    let sharesImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "share")
        return imageView
    }()
    
    let viewsImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "eye")
        return imageView
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "457K"
        label.textColor = #colorLiteral(red: 0.5058823529, green: 0.5490196078, blue: 0.6, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byClipping
        return label
    }()
    
    let commentsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5058823529, green: 0.5490196078, blue: 0.6, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byClipping
        return label
    }()
    
    let sharesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5058823529, green: 0.5490196078, blue: 0.6, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byClipping
        return label
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5058823529, green: 0.5490196078, blue: 0.6, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byClipping
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        overlayFirstLayer() // Первый слой
        overlaySecondLayer() // Второй слой
        overlayThirdLayerOnTopView() // Третий слой на topView
        overlayThirdLayerOnBottomView() // Третий слой на bottomView
        overlayFourthLayerOnBottomViewViews() // Четвертый слой на bottomViewViews
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func configCell(viewModel: FeedCelllViewModel) {
        
        iconImageView.set(imageUrl: viewModel.iconUrlString)
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        
        
        postLabel.frame = viewModel.sizes.postLabelFrame
        postImageView.frame = viewModel.sizes.attachmentFrame
        bottomView.frame = viewModel.sizes.bottomViewFrame
        
        postLabel.frame = viewModel.sizes.postLabelFrame
        postImageView.frame = viewModel.sizes.attachmentFrame
        bottomView.frame = viewModel.sizes.bottomViewFrame
        
        if let photoAttachment = viewModel.photoAttachemets {
            postImageView.set(imageUrl: photoAttachment.photoUrlString )
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }
    }
    
    
    private func overlayFirstLayer() {
        addSubview(cardView)
        // cardView constraints
        cardView.fillSuperview(padding: Constants.cardInsets)
    }
    
    private func overlaySecondLayer() {
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
    
    private func overlayThirdLayerOnTopView() {
        topView.addSubview(iconImageView)
        topView.addSubview(nameLabel)
        topView.addSubview(dateLabel)
        
        // iconImageView constraints
        iconImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        iconImageView.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: Constants.topViewHeight).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: Constants.topViewHeight).isActive = true
        
        // nameLabel constraints
        nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 2).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: Constants.topViewHeight / 2 - 2).isActive = true
        
        // dateLabel constraints
        dateLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -2).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }
    
    private func overlayThirdLayerOnBottomView() {
        bottomView.addSubview(likesView)
        bottomView.addSubview(commentsView)
        bottomView.addSubview(sharesView)
        bottomView.addSubview(viewsView)
        
        likesView.anchor(top: bottomView.topAnchor, leading: bottomView.leadingAnchor, bottom: nil, trailing: nil, size: CGSize(width: Constants.bottomViewViewWidth , height: Constants.bottomViewViewHeight))
        
        commentsView.anchor(top: bottomView.topAnchor, leading: likesView.trailingAnchor, bottom: nil, trailing: nil, size: CGSize(width: Constants.bottomViewViewWidth , height: Constants.bottomViewViewHeight))
        
        sharesView.anchor(top: bottomView.topAnchor, leading: commentsView.trailingAnchor, bottom: nil, trailing: nil, size: CGSize(width: Constants.bottomViewViewWidth , height: Constants.bottomViewViewHeight))
        
        viewsView.anchor(top: bottomView.topAnchor, leading: nil, bottom: nil, trailing: bottomView.trailingAnchor, size: CGSize(width: Constants.bottomViewViewWidth , height: Constants.bottomViewViewHeight))

        
//        // likesView constraints
//        likesView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
//        likesView.leadingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: 8).isActive = true
//        likesView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewWidth).isActive = true
//        likesView.heightAnchor.constraint(equalToConstant: Constants.bottomViewHeight).isActive = true
//
//        // commentsView constraints
//        commentsView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
//        commentsView.leadingAnchor.constraint(equalTo: likesView.trailingAnchor).isActive = true
//        commentsView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewWidth).isActive = true
//        commentsView.heightAnchor.constraint(equalToConstant: Constants.bottomViewHeight).isActive = true
//
//        // sharesView constraints
//        sharesView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
//        sharesView.leadingAnchor.constraint(equalTo: commentsView.trailingAnchor).isActive = true
//        sharesView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewWidth).isActive = true
 //       sharesView.heightAnchor.constraint(equalToConstant: Constants.bottomViewHeight).isActive = true
    }
    
    private func overlayFourthLayerOnBottomViewViews() {
        likesView.addSubview(likesImage)
        likesView.addSubview(likesLabel)
        
        commentsView.addSubview(commentsImage)
        commentsView.addSubview(commentsLabel)
        
        sharesView.addSubview(sharesImage)
        sharesView.addSubview(sharesLabel)
        
        viewsView.addSubview(viewsImage)
        viewsView.addSubview(viewsLabel)
        
        
        helpInFourtLayer(view: likesView, imageView: likesImage, label: likesLabel)
        helpInFourtLayer(view: commentsView, imageView: commentsImage, label: commentsLabel)
        helpInFourtLayer(view: sharesView, imageView: sharesImage, label: sharesLabel)
        helpInFourtLayer(view: viewsView, imageView: viewsImage, label: viewsLabel)
        
        
        
    }
    
    private func helpInFourtLayer(view: UIView, imageView: UIImageView, label: UILabel) {
        
        // imageView constraints
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewsIconSize).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constants.bottomViewViewsIconSize).isActive = true
        
        // label constraints
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 4).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}