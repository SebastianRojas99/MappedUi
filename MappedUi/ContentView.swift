//
//  ContentView.swift
//  MappedUi
//
//  Created by Sebastian Marquez Rojas on 31/03/2024.
//

import SwiftUI
import MapKit
struct ContentView: View {
    //@State private var newMapCamera:MapCameraPosition = .automatic //initial position
    @State private var newMapCamera:MapCameraPosition = .region(.userRegion)//position based in the extension
    var body: some View {
        Map(position:$newMapCamera){
            Marker("you",systemImage: "car.fill",coordinate: .userLocation)
                .tint(.purple)
                
        }
    }
}

extension CLLocationCoordinate2D{
    static var userLocation:CLLocationCoordinate2D{
        return .init(latitude: 25.7602 , longitude: -80.2369)
    }
}

extension MKCoordinateRegion{
    static var userRegion:MKCoordinateRegion{
        return .init(center:.userLocation,latitudinalMeters: 10000,longitudinalMeters: 10000)
    }
}

#Preview {
    ContentView()
}
