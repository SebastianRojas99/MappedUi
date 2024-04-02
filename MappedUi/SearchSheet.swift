//
//  SearchSheet.swift
//  MappedUi
//
//  Created by Sebastian Marquez Rojas on 01/04/2024.
//

import SwiftUI

struct SearchSheet: View {
    
    @Environment(MappedVM.self) var mapModel
    @Binding var showSearch:Bool 
    var body: some View {
        @Bindable var mapModel = mapModel
        NavigationStack{
            VStack{
                TextField("Search...",text:$mapModel.search)
                    .padding(12)
                    .background(.gray.opacity(0.1))
                    .presentationCornerRadius(6)
                    .foregroundStyle(.primary)
            }
        }
        .padding(.all)
        .navigationTitle("Search any place")
            .navigationBarTitleDisplayMode(.inline)
    }
}
 
