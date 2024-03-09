//
//  ComicListView.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import SwiftUI

struct ComicListView<T: ComicListViewModelContract>: View {
    @ObservedObject var viewModel: T
    
    private var listRow: some View {
        ForEach(viewModel.comics, id: \.self) { item in
            NavigationLink(item) {
                
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                listRow
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
