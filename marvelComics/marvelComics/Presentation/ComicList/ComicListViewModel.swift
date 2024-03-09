//
//  ComicListViewModel.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import Foundation

protocol ComicListViewModelContract: ObservableObject {
    var comics: [String] { get }
    var loading: Bool { get set }
}

class ComicListViewModel: ComicListViewModelContract {
    struct UseCases {
        let getList: GetComicListUseCaseContract
    }
    
    @Published var comics: [String] = []
    @Published var loading = false
    private var useCases: UseCases
    
    init(useCases: UseCases) {
        self.useCases = useCases
        getComics()
    }
    
    func getComics() {
        loading = true
        Task {
            do {
                let dataComics = try await useCases.getList.execute()
                DispatchQueue.main.async {
                    self.comics = dataComics.compactMap { $0.title }
                    self.loading = false
                }
            } catch {
                print(error)
                loading = false
            }
        }
    }
}
