//
//  ComicListViewModel.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import Foundation

protocol ComicListViewModelContract: ObservableObject {
    var comics: [String] { get }
}

class ComicListViewModel: ComicListViewModelContract {
    struct UseCases {
        let getList: GetComicListUseCaseContract
    }
    
    @Published var comics: [String] = []
    private var useCases: UseCases
    
    init(useCases: UseCases) {
        self.useCases = useCases
        getComics()
    }
    
    func getComics() {
        Task {
            do {
                let dataComics = try await useCases.getList.execute()
                comics = dataComics.compactMap { $0.title }
            } catch {
                print(error)
            }
        }
    }
}
