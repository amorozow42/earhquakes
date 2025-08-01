//
//  GeoJSON.swift
//  Earthquakes-iOS
//
//  Created by Aleksei Morozow on 01.08.2025.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation

struct GeoJSON: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case features
    }
    
    private enum FeatureCodingKeys: String, CodingKey {
        case properties
    }
    
    private(set) var quakes: [Quake] = []
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        var featuresContainer = try rootContainer.nestedUnkeyedContainer(forKey: .features)
        
        while !featuresContainer.isAtEnd {
            let propertiesContainer = try featuresContainer.nestedContainer(keyedBy: FeatureCodingKeys.self)
            if let quake = try? propertiesContainer.decode(Quake.self, forKey: .properties) {
                quakes.append(quake)
            }
        }
    }
}
