//
//  AppDelegate.swift
//  LauncherApplication
//
//  Created by Leticia Echarri on 10/3/24.
//

import Cocoa

class AutoLauncherAppDelegate: NSObject, NSApplicationDelegate {
    struct Constants {
        // Bundle Identifier of MainApplication target
        static let mainAppBundleID = "leticiaecharri.marvelComics"
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let runningApps = NSWorkspace.shared.runningApplications
        let isRunning = runningApps.contains {
            $0.bundleIdentifier == Constants.mainAppBundleID
        }
        
        if !isRunning {
            var path = Bundle.main.bundlePath as NSString
            for _ in 1...4 {
                path = path.deletingLastPathComponent as NSString
            }
            let applicationPathString = path as String
            guard let pathURL = URL(string: applicationPathString) else { return }
            NSWorkspace.shared.openApplication(at: pathURL,
                                               configuration: NSWorkspace.OpenConfiguration())
        }
    }
}

