//
//  VideoPlayerApp.swift
//  VideoPlayer
//
//  Created by zheng huang on 8/10/22.
//

import SwiftUI

@main
struct VideoPlayerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}
