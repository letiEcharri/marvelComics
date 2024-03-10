//
//  ComicListView.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import SwiftUI

struct ComicListView<T: ComicListViewModelContract>: View {
    @ObservedObject var viewModel: T
    
   var body: some View {
        LoadingView(isShowing: $viewModel.loading) {
            NavigationView {
                List {
                    ForEach(viewModel.sections, id: \.self) { section in
                        Section {
                            ForEach(section.comics, id: \.self) { comic in
                                NavigationLink(destination: Factory.detail.view) {
                                    Text(comic.name)
                                }
                            }
                        } header: {
                            Text(section.name)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Factory.list.view
}

extension Factory {
    internal func makeComicListView(with viewModel: ComicListViewModel) -> some View {
        ComicListView(viewModel: viewModel)
    }
}
