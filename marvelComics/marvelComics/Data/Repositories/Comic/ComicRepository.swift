//
//  ComicRepository.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import Foundation

class ComicRepository: ComicRepositoryContract {
    private let dataSource: DataSource
    
    init(dataSource: DataSource) {
        self.dataSource = dataSource
    }
    
    func getList() async throws -> [Comic] {
        return try await withCheckedThrowingContinuation { continuation in
            dataSource.executeRequest(from: MarvelDataSource.MarvelDataSourceModule.comics.rawValue,
                                      identifier: nil,
                                      parameters: nil) { response in
                guard let data = response as? Data else {
                    let error = NSError(domain: "",
                                        code: 0,
                                        userInfo: ["error": "Error parsing comics"])
                    continuation.resume(throwing: error)
                    return
                }
                do {
                    let dataComics = try JSONDecoder().decode(ComicListResponse.self, from: data)
                    let comics = dataComics.data.results.compactMap { $0.toDomain() }
                    continuation.resume(returning: comics)
                } catch {
                    continuation.resume(throwing: error)
                }
            } failure: { error in
                continuation.resume(throwing: error)
            }
        }
    }
}
