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
            Text(markerSelector?.placemark.countryCode ?? "" )
                  .font(.footnote)
                .bold()
                .foregroundStyle(.gray)
                .lineLimit(2)
        }.padding(.all)
    }
}

