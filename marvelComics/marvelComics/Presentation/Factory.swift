//
//  Factory.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import SwiftUI

enum Factory {
    case list
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .list:
            let repository = ComicRepository()
            let getListUseCase = GetComicListUseCase(repository: repository)
            let useCases = ComicListViewModel.UseCases(getList: getListUseCase)
            makeComicListView(with: ComicListViewModel(useCases: useCases))
        }
    }
}
