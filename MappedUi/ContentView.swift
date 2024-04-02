//
//  ContentView.swift
//  MappedUi
//
//  Created by Sebastian Marquez Rojas on 31/03/2024.
//

import SwiftUI
import MapKit
struct ContentView: View {
    @Environment(MappedVM.self) var mapModel
    var body: some View {
        @Bindable var mapModelBinding = mapModel
        Map(position:  $mapModelBinding.newMapCamera){
            Marker("you",systemImage: "car.fill",coordinate: .userLocation)
            .tint(.purple)
            Annotation("McDonalds", coordinate: .mcDonaldsTest ){
             ZStack{
                 Image(systemName: "mappin").foregroundStyle(Color.purple).font(.system(size: 25))
             }
            }
        }.mapControls{
            MapPitchToggle()
            MapUserLocationButton()
        }
    }
}



/*#Preview {
    ContentView()
}*/
 
