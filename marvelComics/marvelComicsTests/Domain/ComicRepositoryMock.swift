//
//  ComicRepositoryMock.swift
//  marvelComicsTests
//
//  Created by Leticia Echarri on 10/3/24.
//

import Foundation
@testable import marvelComics

class ComicRepositoryMock: ComicRepositoryContract {
    var error: Error?
    
    func getList() async throws -> [Comic] {
        if let error = error {
            throw error
        }
        return try await withCheckedThrowingContinuation { continuation in
            getComics { result in
                continuation.resume(with: result)
            }
        }
    }
}

extension ComicRepositoryMock: LocalJsonService {
    func getComics(completion: @escaping (Result<[Comic], Error>) -> Void) {
        readJson(.comics) { result in
            switch result {
            case .success(let result):
                do {
                    let data = try JSONSerialization.data(withJSONObject: result, options: [])
                    let dataComics = try JSONDecoder().decode(ComicListResponse.self, from: data)
                    let comics = dataComics.data.results.compactMap { $0.toDomain() }
                    completion(.success(comics))
                 } catch {
                     completion(.failure(error))
                 }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
