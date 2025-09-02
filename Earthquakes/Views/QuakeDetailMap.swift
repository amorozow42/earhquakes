//
//  QuakeDetailMap.swift
//  Earthquakes-iOS
//
//  Created by Aleksei Morozow on 14.08.2025.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI
import MapKit

struct QuakeDetailMap: View {
    @State private var cameraPosition: MapCameraPosition = .automatic
    let location: QuakeLocation
    let tintColor: Color
    private var place: QuakePlace
    
    init(location: QuakeLocation, tintColor: Color) {
        self.location = location
        self.tintColor = tintColor
        self.place = QuakePlace(location: location)
    }
    
    var body: some View {
        Map(position: $cameraPosition) {
            Marker("", coordinate: place.location).tint(tintColor)
        }
        .onAppear {
            withAnimation {
                var region = MKCoordinateRegion()
                region.center = place.location
                region.span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                cameraPosition = .region(region)
            }
        }
    }
}

struct QuakePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    
    init(id: UUID = UUID(), location: QuakeLocation) {
        self.id = id
        self.location = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
}
