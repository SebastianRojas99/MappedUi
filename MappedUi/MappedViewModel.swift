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
    var markerSelection:MKMapItem?
    var showLocation = false
    
    func searching() async{
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        request.region = .userRegion
        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
        search = ""
    }
    func showRoutes() async{
        
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
