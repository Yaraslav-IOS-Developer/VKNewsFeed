//
//  NewsFeedCodeCell.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 10.06.2021.
//

import UIKit

protocol NewsfeedCodeCellDelegate: class {
    func revealPost(for cell: NewsFeedCodeCell)
}

final class NewsFeedCodeCell: UITableViewCell {
    
    static let reusedId = "NewsFeedCodeCell"
    weak var delegate: NewsfeedCodeCellDelegate?
    
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
        label.textColor = #colorLiteral(red: 0.227329582, green: 0.2323184013, blue: 0.2370472848, alpha: 1)
        return label
    }()
    
    let moreTextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(#colorLiteral(red: 0.4, green: 0.6235294118, blue: 0.831372549, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentVerticalAlignment = .center
        button.setTitle("Показать полностью...", for: .normal)
        return button
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
        label.textColor = #colorLiteral(red: 0.227329582, green: 0.2323184013, blue: 0.2370472848, alpha: 1)
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
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        return view
    }()
    
    let commentsView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        return view
    }()
    
    let sharesView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
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
    
    override func prepareForReuse() {
        iconImageView.set(imageUrl: nil)
        postImageView.set(imageUrl: nil)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImageView.layer.cornerRadius = Constants.topViewHeight / 2
        iconImageView.clipsToBounds = true
        
        backgroundColor = .clear
        selectionStyle = .none
        
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        
        moreTextButton.addTarget(self, action: #selector(moreTextButtonTouch), for: .touchUpInside)
        
        overlayFirstLayer() // Первый слой
        overlaySecondLayer() // Второй слой
        overlayThirdLayerOnTopView() // Третий слой на topView
        overlayThirdLayerOnBottomView() // Третий слой на bottomView
        overlayFourthLayerOnBottomViewViews() // Четвертый слой на bottomViewViews
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func moreTextButtonTouch() {
        print("555")
        delegate?.revealPost(for: self)
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
        moreTextButton.frame = viewModel.sizes.moreTextButtonFrame
        
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
        cardView.addSubview(moreTextButton)
        cardView.addSubview(postImageView)
        cardView.addSubview(bottomView)
        
        // topView constraints
        topView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8).isActive = true
        topView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8).isActive = true
        topView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8).isActive = true
        topView.heightAnchor.constraint(equalToConstant: Constants.topViewHeight).isActive = true
        
        // postLabel constraints
        
        // moreTextButton constraints
        
        
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
        
//        likesView.anchor(top: bottomView.topAnchor, leading: bottomView.leadingAnchor, bottom: nil, trailing: nil, size: CGSize(width: Constants.bottomViewViewWidth , height: Constants.bottomViewViewHeight))
//
//        commentsView.anchor(top: bottomView.topAnchor, leading: likesView.trailingAnchor, bottom: nil, trailing: nil, size: CGSize(width: Constants.bottomViewViewWidth , height: Constants.bottomViewViewHeight))
//
//        sharesView.anchor(top: bottomView.topAnchor, leading: commentsView.trailingAnchor, bottom: nil, trailing: nil, size: CGSize(width: Constants.bottomViewViewWidth , height: Constants.bottomViewViewHeight))
//
//        viewsView.anchor(top: bottomView.topAnchor, leading: nil, bottom: nil, trailing: bottomView.trailingAnchor, size: CGSize(width: Constants.bottomViewViewWidth , height: Constants.bottomViewViewHeight))

        
        // likesView constraints
        likesView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        likesView.leadingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: 8).isActive = true
        likesView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewWidth).isActive = true
        likesView.heightAnchor.constraint(equalToConstant: Constants.bottomViewHeight).isActive = true

        // commentsView constraints
        commentsView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        commentsView.leadingAnchor.constraint(equalTo: likesView.trailingAnchor).isActive = true
        commentsView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewWidth).isActive = true
        commentsView.heightAnchor.constraint(equalToConstant: Constants.bottomViewHeight).isActive = true

        // sharesView constraints
        sharesView.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        sharesView.leadingAnchor.constraint(equalTo: commentsView.trailingAnchor).isActive = true
        sharesView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewWidth).isActive = true
        sharesView.heightAnchor.constraint(equalToConstant: Constants.bottomViewHeight).isActive = true
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
