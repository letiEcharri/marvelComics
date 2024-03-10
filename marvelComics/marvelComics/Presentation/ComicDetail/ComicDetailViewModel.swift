//
//  ComicDetailViewModel.swift
//  marvelComics
//
//  Created by Leticia Echarri on 10/3/24.
//

import Foundation

protocol ComicDetailViewModelContract: ObservableObject {
    var comic: ComicDetailViewModel.DetailModel { get }
}

class ComicDetailViewModel: ComicDetailViewModelContract {
    struct DetailModel {
        let title: String
        let description: String
        let creator: String
        
        var formattedDescription: String {
            (description == "") ? "No description provided" : description
        }
    }
    
    @Published var comic: DetailModel
    
    init(comic: DetailModel) {
        self.comic = comic
    }
}
