//
//  Factory.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import SwiftUI

enum Factory {
    case list
    case detail(ComicDetailViewModel.DetailModel)
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .list:
            let dataSource = MarvelDataSource()
            let repository = ComicRepository(dataSource: dataSource)
            let getListUseCase = GetComicListUseCase(repository: repository)
            let getComicListGroupByCreatorUseCase = GetComicListGroupByCreatorUseCase(repository: repository)
            let useCases = ComicListViewModel.UseCases(getList: getListUseCase,
                                                       getGroupedList: getComicListGroupByCreatorUseCase)
            makeComicListView(with: ComicListViewModel(useCases: useCases))
        case .detail(let comic):
            let viewModel = ComicDetailViewModel(comic: comic)
            makeComicDetailView(with: viewModel)
        }
    }
}
