//
//  AppDelegate.swift
//  marvelComics
//
//  Created by Leticia Echarri on 10/3/24.
//

import Foundation
import AppKit
import SwiftUI
import ServiceManagement

final class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var menuExtrasConfigurator: MacExtrasConfigurator?
    
    final private class MacExtrasConfigurator: NSObject {
        
        private var statusBar: NSStatusBar
        private var statusItem: NSStatusItem
        private var mainView: NSView
        
        private struct MenuView: View {
            var body: some View {
                HStack {
                    Text("Hello from SwiftUI View")
                    Spacer()
                }
                .background(Color.blue)
                .padding()
            }
        }
        
        // MARK: - Lifecycle
        
        override init() {
            statusBar = NSStatusBar.system
            statusItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
            mainView = NSHostingView(rootView: MenuView())
            mainView.frame = NSRect(x: 0, y: 0, width: 300, height: 250)
            
            super.init()
            
            if let statusBarButton = statusItem.button {
                statusBarButton.image = NSImage(named: "StatusBarIcon")
            }
        }
    }
    
    // MARK: - NSApplicationDelegate
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Autostart at login
        let _ = try? SMAppService.mainApp.register()
        
        // Statusbar icon
        menuExtrasConfigurator = .init()
    }
}
