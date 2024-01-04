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
    let import_datetime: Date
    let images: Image
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case title
        case import_datetime = "importDatetime"
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
    let avatar_url: URL
    let description: String
    let instagram_url: URL
    let website_url: URL
    let is_verified: Bool
    
    enum CodingKeys: String, CodingKey {
        case avatar_url = "avatarUrl"
        case description
        case instagram_url = "instagramUrl"
        case website_url = "websiteUrl"
        case is_verified = "isVerified"
    }
}
