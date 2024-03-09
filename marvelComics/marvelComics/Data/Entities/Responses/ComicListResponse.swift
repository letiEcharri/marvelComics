//
//  ComicResponse.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import Foundation

struct ComicListResponse: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let data: ComicListData
}

struct ComicListData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [ComicListDataResult]
}

struct ComicListDataResult: Codable {
    let id: Int
    let digitalId: Int
    let title: String
    let issueNumber: Double
    let variantDescription: String?
    let description: String?
    let isbn: String
}
