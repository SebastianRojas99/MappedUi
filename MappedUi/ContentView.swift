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
    @State private var showSearch = true
    var body: some View {
        @Bindable var mapModel = mapModel
        Map(position:  $mapModel.newMapCamera, selection:$mapModel.markerSelector){
                Marker("you",systemImage: "car.fill",coordinate: .userLocation)
                .tint(.purple)
                
                ForEach(mapModel.results, id:\.self){ item in
                    if mapModel.routeDisplay{
                        if item == mapModel.routeDestination{
                            let placemark = item.placemark
                            Marker(placemark.title ??  "", coordinate: placemark.coordinate)
                        }
                    }else{
                        let placemark = item.placemark
                        Marker(placemark.title ??  "", coordinate: placemark.coordinate)
                    }
                }
                if let route = mapModel.route{
                    MapPolyline(route.polyline)
                        .stroke(.blue,lineWidth: 6)
                }
            }
            .overlay(alignment:.topLeading){
                VStack{
                    Button{
                        mapModel.showLocation = false
                        showSearch = true
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
            .onChange(of: mapModel.getDirections, {oldValue,newValue in
                if newValue{
                    mapModel.fetchRoutes()
                }
            })
            .onChange(of: mapModel.markerSelector,{oldValue,newValue in
                mapModel.showLocation = newValue != nil
            })
            .sheet(isPresented: $showSearch, content: {
                 SearchSheet(showSearch: $showSearch)
                    .presentationDetents([.height(150)])
                    .presentationCornerRadius(15)
                    .presentationBackground(.ultraThinMaterial)
            })
            .sheet(isPresented:$mapModel.showLocation,content:{
                LocationView(markerSelector: $mapModel.markerSelector, showLocation: $mapModel.showLocation, getDirections: $mapModel.getDirections)
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




 
