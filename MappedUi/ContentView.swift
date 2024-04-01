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
            Annotation("McDonalds", coordinate: .mcDonaldsTest ){
             ZStack{
                 Image(systemName: "mappin").foregroundStyle(Color.purple).font(.system(size: 25))
             }
            }
        }
    }
}

extension CLLocationCoordinate2D{
    static var userLocation:CLLocationCoordinate2D{
        return .init(latitude: 25.7602 , longitude: -80.2369)
    }
     static var mcDonaldsTest:CLLocationCoordinate2D{
        return .init(latitude: 25.721620597897765, longitude: -80.27600264490206)
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

/*Annotation("You ", coordinate: .userLocation ){
 ZStack{
     Circle()
         .stroke(Color.blue,lineWidth: 10)
         .background(Circle().fill(.clear))
         .frame(width:100 ,height: 100)
         .overlay{
             Image(systemName: "car.fill").font(.system(size: 40)).foregroundStyle(.purple).opacity(0.85 )
         }
 //Image(systemName: "car.fill").foregroundStyle(Color.purple)
 }
 
}*/ //annotation for personalization
