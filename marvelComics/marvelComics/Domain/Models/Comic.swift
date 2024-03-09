//
//  Comic.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import Foundation

struct Comic {
    let id: Int
    let digitalId: Int
    let title: String
    let issueNumber: Double
    let variantDescription: String?
    let description: String?
    let isbn: String
    let creators: ComicCreators?
}

struct ComicCreators: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicCreatorsItem]?
    let returned: Int?
}

struct ComicCreatorsItem: Codable {
    let resourceURI: String?
    let name, role: String?
}

