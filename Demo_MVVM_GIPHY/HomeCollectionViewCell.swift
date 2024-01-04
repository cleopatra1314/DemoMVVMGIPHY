//
//  HomeCollectionViewCell.swift
//  Demo_MVVM_GIPHY
//
//  Created by cleopatra on 2024/1/3.
//

import Foundation
import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    var item: GIPItem? {
        didSet {
            guard let item else { return }
            let isVerifiedStarImage = (item.user.is_verified) ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
            setData(title: item.title, gipGifImage: item.images.original, userImage: item.user.avatar_url, userName: item.user, isVerifiedStar: isVerifiedStarImage, importdate: item.import_datetime, description: item.user.description)
        }
    }
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .blue
        titleLabel.font = .systemFont(ofSize: 22, weight: .bold)
        return titleLabel
    }()
    private let gipGifImageView: UIImageView = {
        let gipGifImageView = UIImageView()
        return gipGifImageView
    }()
    private let userImageView: UIImageView = {
        let userImageView = UIImageView()
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.cornerRadius = 20
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
        importDateLabel.textColor = .lightGray
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
        descriptionLabel.textColor = .darkGray
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        return descriptionLabel
    }()
    
    func setData(title: String, gipGifImageUrl: UIImage, userImageUrl: UIImage, userName: String, isVerifiedStar: UIImage, importdate: String, description: String) {
        self.titleLabel.text = title
        self.gipGifImageView.image = gipGifImage
        self.userImageView.image = userImage
        self.userNameLabel.text = userName
        self.isVerifiedView.image = isVerifiedStar
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
        }
        gipGifImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.right.equalTo(contentView).offset(16)
        }
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(gipGifImageView.snp.bottom).offset(8)
            make.left.equalTo(contentView).offset(16)
        }
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView)
            make.left.equalTo(userImageView.snp.right).offset(4)
        }
        isVerifiedView.snp.makeConstraints { make in
            make.top.equalTo(userImageView)
            make.left.equalTo(userNameLabel.snp.right).offset(4)
        }
        importDateLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView)
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
        }
    }
}
