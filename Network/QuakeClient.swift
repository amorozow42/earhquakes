//
//  QuakeClient.swift
//  Earthquakes-iOS
//
//  Created by Aleksei Morozow on 08.08.2025.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation

struct QuakeClient {
    
    private let feedURL = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson")!
    
    private var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .millisecondsSince1970
        return aDecoder
    }()
    
    private let downloader: any HTTPDataDownloader
    
    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }
    
    var quakes: [Quake] {
        get async throws {
            let data = try await downloader.fetchData(from: feedURL)
            let allQuakes = try decoder.decode(GeoJSON.self, from: data)
            return allQuakes.quakes
        }
    }
}
