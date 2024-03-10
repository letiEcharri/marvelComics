//
//  marvelComicsApp.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import SwiftUI
import ServiceManagement

@main
struct marvelComicsApp: App {
    var body: some Scene {
        WindowGroup {
            let _ = try? SMAppService.mainApp.register()
            Factory.list.view
        }
    }
}
