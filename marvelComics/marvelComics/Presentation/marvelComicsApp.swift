//
//  marvelComicsApp.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import SwiftUI

@main
struct marvelComicsApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            Factory.list.view
        }
    }
}
