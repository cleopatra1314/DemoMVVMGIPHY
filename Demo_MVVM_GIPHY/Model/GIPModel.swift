//
//  GIPVIewModel.swift
//  Demo_MVVM_GIPHY
//
//  Created by cleopatra on 2024/1/3.
//

import Foundation
import UIKit

struct GIPModel: Codable {
    let data: [GIPItem]
}

struct GIPItem: Codable {
    let title: String
    let username: String
    let importDateTime: String
    let images: Image
    let user: User?
    
    enum CodingKeys: String, CodingKey {
        case title
        case username
        case importDateTime = "import_datetime"
        case images
        case user
    }
}

struct Image: Codable {
    let original: OriginalImage
}

struct OriginalImage: Codable {
    let url: URL
}

struct User: Codable {
    let avatarUrl: URL
    let description: String
    let instagramUrl: String
    let websiteUrl: String
    let isVerified: Bool
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case description
        case instagramUrl = "instagram_url"
        case websiteUrl = "website_url"
        case isVerified = "is_verified"
    }
}
