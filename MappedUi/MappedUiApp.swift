//
//  MappedUiApp.swift
//  MappedUi
//
//  Created by Sebastian Marquez Rojas on 31/03/2024.
//

import SwiftUI

@main
struct MappedUiApp: App {
    @State private var map = MappedVM()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(map)
        }
    }
}
