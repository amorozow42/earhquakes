//
//  EarthquakesTests.swift
//  EarthquakesTests
//
//  Created by Aleksei Morozow on 30.07.2025.
//  Copyright © 2025 Apple. All rights reserved.
//

import Testing
import Foundation
@testable import Earthquakes

struct EarthquakesTests {
    
    @Test func geoJSONDecoderDecodesQuake() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970

        let quake = try decoder.decode(Quake.self, from: testFeature_nc73649170)
        #expect(quake.code == "73649170")
        
        let expectedSeconds = TimeInterval(1636129710550 / 1000.0)
        let expectedTime = Date(timeIntervalSince1970: expectedSeconds)
        
        #expect(quake.time == expectedTime)
    }
}
