//
//  GetComicListGroupByCreatorUseCase.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import Foundation

protocol GetComicListGroupByCreatorUseCaseContract {
    func execute() async throws -> [ComicsGrouped]
}

struct ComicWithCreator {
    let key: String
    let comic: Comic
}

struct ComicsGrouped {
    let key: String
    let comics: [Comic]
}

struct GetComicListGroupByCreatorUseCase: GetComicListGroupByCreatorUseCaseContract {
    private let repository: ComicRepositoryContract

    init(repository: ComicRepositoryContract) {
        self.repository = repository
    }

    func execute() async throws -> [ComicsGrouped] {
        let comics = try await repository.getList()
        let dictionary = comics.compactMap {
            ComicWithCreator(key: getCreatorName(from: $0.creators?.items),
                             comic: $0)
        }
        let grouped = Dictionary(grouping: dictionary, by: { $0.key }).compactMap { item in
            ComicsGrouped(key: item.key,
                          comics: item.value.compactMap { $0.comic })
        }
        return grouped
    }
    
    private func getCreatorName(from items: [ComicCreatorsItem]?) -> String {
        guard let item = items?.first(where: { $0.name != nil }),
                let name = item.name else {
            return "Unknown"
        }
        return name
    }
}
