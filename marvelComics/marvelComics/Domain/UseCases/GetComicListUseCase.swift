//
//  GetComicListUseCase.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import Foundation

protocol GetComicListUseCaseContract {
    func execute() async throws -> [Comic]
}

struct GetComicListUseCase: GetComicListUseCaseContract {
    private let repository: ComicRepositoryContract

    init(repository: ComicRepositoryContract) {
        self.repository = repository
    }

    func execute() async throws -> [Comic] {
        try await repository.getList()
    }
}
