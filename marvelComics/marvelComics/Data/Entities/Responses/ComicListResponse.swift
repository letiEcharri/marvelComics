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
    let creators: ComicResultCreators?
    
    func toDomain() -> Comic {
        Comic(id: id,
              digitalId: digitalId,
              title: title,
              issueNumber: issueNumber,
              variantDescription: variantDescription,
              description: description,
              isbn: isbn, 
              creators: creators?.toDomain())
    }
}
    

struct ComicResultCreators: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicResultCreatorsItem]?
    let returned: Int?
    
    func toDomain() -> ComicCreators {
        ComicCreators(available: available,
                      collectionURI: collectionURI,
                      items: items?.compactMap { $0.toDomain() },
                      returned: returned)
    }
}

struct ComicResultCreatorsItem: Codable {
    let resourceURI: String?
    let name, role: String?
    
    func toDomain() -> ComicCreatorsItem {
        ComicCreatorsItem(resourceURI: resourceURI,
                          name: name,
                          role: role)
    }
}
