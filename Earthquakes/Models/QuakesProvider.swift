//
//  QuakesProvider.swift
//  Earthquakes-iOS
//
//  Created by Aleksei Morozow on 08.08.2025.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation

@Observable
class QuakesProvider {
    
    var quakes: [Quake] = []
    
    let client: QuakeClient
    
    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }
    
    func fetchQuakes() async throws {
        quakes = try await client.quakes
    }
    
    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }
    
    func location(for quake: Quake) async throws -> QuakeLocation {
        return try await client.quakeLocation(from: quake.detail)
    }
}
