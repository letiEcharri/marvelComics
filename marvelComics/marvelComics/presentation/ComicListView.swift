//
//  ComicListView.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import SwiftUI

struct ComicListView: View {
    private var listRow: some View {
        ForEach(0...5, id: \.self) { item in
            NavigationLink("Prueba \(item)") {
                
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
    ComicListView()
}
