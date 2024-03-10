//
//  ComicListViewModel.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import Foundation

protocol ComicListViewModelContract: ObservableObject {
    var sections: [ComicListViewModel.Section] { get }
    var loading: Bool { get set }
}

class ComicListViewModel: ComicListViewModelContract {
    struct Section: Hashable {
        let name: String
        let comics: [ComicData]
    }
    
    struct ComicData: Hashable {
        let id: Int
        let name: String
        let description: String
    }
    
    struct UseCases {
        let getList: GetComicListUseCaseContract
        let getGroupedList: GetComicListGroupByCreatorUseCaseContract
    }
    
    @Published var sections: [Section] = []
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
                let dataComics = try await useCases.getGroupedList.execute()
                DispatchQueue.main.async {
                    self.sections = dataComics.compactMap {
                        Section(name: $0.key,
                                comics: $0.comics.compactMap { item in
                            ComicData(id: item.id,
                                      name: item.title,
                                      description: item.description ?? "")
                        } )
                    }
                    self.loading = false
                }
            } catch {
                print(error)
                loading = false
            }
        }
    }
}
