//
//  LispEditorApp.swift
//  LispEditor
//
//  Created by Breno on 11/03/21.
//

import SwiftUI
import SwiftLisp

@main
struct LispEditorApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView(env: try! loadBaseFiles())
        }
    }
}
