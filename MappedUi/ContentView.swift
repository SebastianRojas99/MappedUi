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
    @State private var showSearch = false
    var body: some View {
        @Bindable var mapModelBinding = mapModel
        Map(position:  $mapModelBinding.newMapCamera, selection:$mapModelBinding.markerSelection  ){
                Marker("you",systemImage: "car.fill",coordinate: .userLocation)
                .tint(.purple)
                
                ForEach(mapModel.results, id:\.self){ item in
                    let placemark = item.placemark
                    Marker(placemark.title ?? "", coordinate: placemark.coordinate)
                }
            }
            .overlay(alignment:.topLeading){
                VStack{
                    Button{
                        showSearch.toggle()
                    }label: {
                        Image(systemName: "magnifyingglass")
                            .font(.largeTitle)
                            .foregroundStyle(.purple)
                    }
                    Button{
                        
                    }label: {
                        Image(systemName: "car.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.purple)
                    }
                    
                }.padding(.leading,15)
            }
            .onChange(of:mapModelBinding.markerSelection,{oldValue,newValue in
                mapModelBinding.showLocation = newValue != nil
            })
            .sheet(isPresented: $showSearch, content: {
                 SearchSheet(showSearch: $showSearch)
                    .presentationDetents([.height(150)])
                    .presentationCornerRadius(15)
                    .presentationBackground(.ultraThinMaterial)
            })
            .sheet(isPresented:$mapModelBinding.showLocation,content:{
                LocationView(markerSelector: $mapModelBinding.markerSelection, showLocation: $mapModelBinding.showLocation)
                    .presentationDetents([.height(150)])
                    .presentationBackgroundInteraction(.enabled(upThrough: .height(350)))//mantiene ventana y mapa a la vez
                    .presentationCornerRadius(15)
                    .presentationBackground(.ultraThinMaterial)
            })
            .mapControls{
                MapPitchToggle()
                MapUserLocationButton()
            }

    }
}



#Preview {
    ContentView().environment(MappedVM())
}
 
