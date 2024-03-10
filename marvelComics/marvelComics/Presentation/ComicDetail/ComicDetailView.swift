//
//  ComicDetailView.swift
//  marvelComics
//
//  Created by Leticia Echarri on 10/3/24.
//

import SwiftUI

struct ComicDetailView<T: ComicDetailViewModelContract>: View {
    @ObservedObject var viewModel: T
    
    var body: some View {
        VStack(spacing: 10) {
            Text(viewModel.comic.title)
                .fontWeight(.bold)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            HStack {
                Text("Creator:")
                    .fontWeight(.bold)
                Text(viewModel.comic.creator)
            }
            Text("DESCRIPTION")
                .fontWeight(.bold)
            Text(viewModel.comic.formattedDescription)
        }
        .padding(EdgeInsets(top: 10,
                            leading: 10,
                            bottom: 10,
                            trailing: 10))
    }
}

#Preview {
    Factory.detail(ComicDetailViewModel.DetailModel(title: "Ironman",
                                                    description: "This is a description", 
                                                    creator: "John"))
    .view
}

extension Factory {
    internal func makeComicDetailView(with viewModel: ComicDetailViewModel) -> some View {
        ComicDetailView(viewModel: viewModel)
    }
}
