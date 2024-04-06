//
//  exampleview.swift
//  MappedUi
//
//  Created by Sebastian Marquez Rojas on 05/04/2024.
//

import SwiftUI

struct exampleview: View {
    var vm = MappedVM()
    var body: some View {
        Button("press"){
            vm.sumArray(arr: [])
        }
    }
}

#Preview {
    exampleview()
}
