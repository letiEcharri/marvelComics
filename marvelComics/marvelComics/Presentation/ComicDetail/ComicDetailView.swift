//
//  ComicDetailView.swift
//  marvelComics
//
//  Created by Leticia Echarri on 10/3/24.
//

import SwiftUI

struct ComicDetailView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Description")
        }
        .padding(EdgeInsets(top: 10,
                            leading: 10,
                            bottom: 10,
                            trailing: 10))
    }
}

#Preview {
    Factory.detail.view
}

extension Factory {
    internal func makeComicDetailView() -> some View {
        ComicDetailView()
    }
}
