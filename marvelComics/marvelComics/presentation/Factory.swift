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
            makeComicListView(with: ComicListViewModel())
        }
    }
}
