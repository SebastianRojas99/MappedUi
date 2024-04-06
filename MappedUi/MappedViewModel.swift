//
//  MappedViewModel.swift
//  MappedUi
//
//  Created by Sebastian Marquez Rojas on 01/04/2024.
//

import Foundation
import Observation
import SwiftUI
import MapKit

@Observable
class MappedVM{
    var newMapCamera:MapCameraPosition = .region(.userRegion)//position based in the extension
    var search :String = ""
    var results =  [MKMapItem]()
    var markerSelector:MKMapItem?
    var showLocation = false
    var getDirections  = false
    var routeDisplay = false
    var route : MKRoute?
    var routeDestination : MKMapItem?
    
    func searching() async{
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        request.region = .userRegion
        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
        search = ""
        getDirections = false
        routeDisplay = false
    }
    func fetchRoutes(){
        if let markerSelector{
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: .userLocation))
            request.destination = markerSelector
            Task{
                let res = try? await MKDirections(request: request).calculate()
                route = res?.routes.first
                routeDestination = markerSelector
                withAnimation(.snappy){
                    routeDisplay = true
                    showLocation = false
                    if let rect = route?.polyline.boundingMapRect, routeDisplay{
                        newMapCamera = .rect(rect)
                    }
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
