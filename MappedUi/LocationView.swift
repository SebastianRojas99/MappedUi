//
//  LocationView.swift
//  MappedUi
//
//  Created by Sebastian Marquez Rojas on 03/04/2024.
//

import SwiftUI
import MapKit


struct LocationView: View {
    @Binding var markerSelector : MKMapItem?
    @Binding var showLocation : Bool
    @State private var lookAround:MKLookAroundScene?
    var body: some View {
        VStack{
            Text(markerSelector?.placemark.name ?? "")
                .font(.title)
                .bold()
                .padding(.top,10)
            Text(markerSelector?.placemark.title ?? "")
                .font(.footnote)
                .bold()
                .foregroundStyle(.gray)
                .lineLimit(2)
                .padding(.trailing)
            if let scene = lookAround{
                LookAroundPreview(initialScene: scene)
                    .frame(height: 200)
                    .cornerRadius(12)
                    .padding(.all)
            }
        }.padding(.all)
            .onAppear{
                fetchAroundPreview()
            }
            .onChange(of: markerSelector){ oldValue,newValue in
                fetchAroundPreview()
            }
                
    }
}

extension LocationView{
    func fetchAroundPreview(){
        if let markerSelector{
            lookAround = nil
            Task{
                let request = MKLookAroundSceneRequest(mapItem: markerSelector)
                lookAround = try? await request.scene
            }
        }
    }
}
