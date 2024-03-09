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
    @Published var comics: [String] = []
    
    init() {
        getComics()
    }
    
    func getComics() {
        for i in 0...5 {
            comics.append("Comic \(i)")
        }
    }
}
