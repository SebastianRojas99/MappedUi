//
//  ContentView.swift
//  MappedUi
//
//  Created by Sebastian Marquez Rojas on 31/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "car.fill")
                .imageScale(.large)
                .foregroundStyle(.red)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
