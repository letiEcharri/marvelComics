//
//  main.swift
//  LauncherApplication
//
//  Created by Leticia Echarri on 10/3/24.
//

import Cocoa

let delegate = AutoLauncherAppDelegate()
NSApplication.shared.delegate = delegate
_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
