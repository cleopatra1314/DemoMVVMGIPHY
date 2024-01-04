//
//  HomeCollectionViewCell.swift
//  Demo_MVVM_GIPHY
//
//  Created by cleopatra on 2024/1/3.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

class HomeCollectionViewCell: UICollectionViewCell {
    
    var item: GIPItem? {
        didSet {
            guard let item = item,
                  let itemUser = item.user else { return }

            setData(title: item.title, gipGifImageUrl: item.images.original.url, userImageUrl: itemUser.avatarUrl, userName: item.username, isVerified: itemUser.isVerified, importdate: item.importDateTime, description: itemUser.description)
        }
    }
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .blue
        titleLabel.font = .systemFont(ofSize: 22, weight: .bold)
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    private let gipGifImageView: UIImageView = {
        let gipGifImageView = UIImageView()
        gipGifImageView.contentMode = .scaleAspectFill
        gipGifImageView.clipsToBounds = true
        return gipGifImageView
    }()
    private let userImageView: UIImageView = {
        let userImageView = UIImageView()
        userImageView.contentMode = .scaleAspectFill
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = 14
        return userImageView
    }()
    private let userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.textColor = .darkGray
        userNameLabel.font = .systemFont(ofSize: 18, weight: .regular)
        return userNameLabel
    }()
    private let isVerifiedView: UIImageView = {
        let isVerifiedView = UIImageView()
        return isVerifiedView
    }()
    private let importDateLabel: UILabel = {
        let importDateLabel = UILabel()
        importDateLabel.textColor = .darkGray
        importDateLabel.font = .systemFont(ofSize: 18, weight: .regular)
        return importDateLabel
    }()
    private let instagramButton: UIButton = {
        let instagramButton = UIButton()
        instagramButton.backgroundColor = .cyan
        return instagramButton
    }()
    private let websiteButton: UIButton = {
        let websiteButton = UIButton()
        websiteButton.backgroundColor = .green
        return websiteButton
    }()
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = .brown
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(title: String, gipGifImageUrl: URL, userImageUrl: URL, userName: String, isVerified: Bool, importdate: String, description: String) {
        
        let isVerifiedStarImage = isVerified ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        self.titleLabel.text = title
        self.gipGifImageView.sd_setImage(with: gipGifImageUrl)
        self.userImageView.sd_setImage(with: userImageUrl)
        self.userNameLabel.text = userName
        self.isVerifiedView.image = isVerifiedStarImage
        self.importDateLabel.text = importdate
        self.instagramButton.setTitle("Instagram", for: .normal)
        self.websiteButton.setTitle("website", for: .normal)
        self.descriptionLabel.text = description
    }
    
    private func setUp() {
        
        [titleLabel, gipGifImageView, userImageView, userNameLabel, isVerifiedView, importDateLabel, instagramButton, websiteButton, descriptionLabel].forEach{ subView in
            contentView.addSubview(subView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalTo(contentView).offset(16)
            make.right.lessThanOrEqualTo(contentView).offset(-16)
        }
        gipGifImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(contentView).offset(16)
            make.right.equalTo(contentView).offset(-16)
            make.height.equalTo(gipGifImageView.snp.width).multipliedBy(0.75)
        }
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(gipGifImageView.snp.bottom).offset(8)
            make.left.equalTo(contentView).offset(16)
            make.height.width.equalTo(28)
        }
        userNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView)
            make.left.equalTo(userImageView.snp.right).offset(4)
        }
        isVerifiedView.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView)
            make.left.equalTo(userNameLabel.snp.right).offset(4)
        }
        importDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView)
            make.right.equalTo(contentView).offset(-16)
        }
        instagramButton.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(16)
            make.top.equalTo(userImageView.snp.bottom).offset(8)
        }
        websiteButton.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(16)
            make.top.equalTo(instagramButton.snp.bottom).offset(8)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(16)
            make.top.equalTo(websiteButton.snp.bottom).offset(8)
            make.bottom.equalTo(contentView).offset(-16)
            make.right.lessThanOrEqualTo(contentView).offset(-16)
        }
    }
}
