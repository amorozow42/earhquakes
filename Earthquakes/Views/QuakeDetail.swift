//
//  QuakeDetail.swift
//  Earthquakes-iOS
//
//  Created by Aleksei Morozow on 14.08.2025.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI

struct QuakeDetail: View {
    let quake: Quake
    @State private var formatLocation = true
    @State private var location: QuakeLocation?
    @Environment(QuakesProvider.self) private var quakesProvider
    
    var body: some View {
        VStack {
            if let location = self.location {
                QuakeDetailMap(location: location, tintColor: quake.color)
                    .ignoresSafeArea(.container)
            }
            
            QuakeMagnitude(quake: quake)
            
            Text(quake.place)
                .font(.title3)
                .bold()

            Text(quake.time.formatted())
                .foregroundStyle(.secondary)

            if let location {
                Group {
                    if formatLocation {
                        Text("Latitude: \(formatFloatingNumber(location.latitude))")
                        Text("Longitude: \(formatFloatingNumber(location.longitude))")
                    } else {
                        Text("Latitude: \(location.latitude)")
                        Text("Longitude: \(location.longitude)")
                    }
                    
                }
                .onTapGesture {
                    formatLocation.toggle()
                }
            }
        }
        .task {
            if location == nil {
                if let quakeLocation = quake.location {
                    location = quakeLocation
                } else {
                    location = try? await quakesProvider.location(for: quake)
                }
            }
        }
    }
    
    private func formatFloatingNumber(_ number: Double) -> String {
        return number
            .formatted(
                .number.precision(
                    .fractionLength(3)))
    }
}

#Preview {
    QuakeDetail(quake: Quake.preview)
        .environment(
            QuakesProvider(client:
                QuakeClient(downloader: TestDownloader())))
}
