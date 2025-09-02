//
//  CacheEntry.swift
//  Earthquakes-iOS
//
//  Created by Aleksei Morozow on 12.08.2025.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation

final class CacheEntryObject {
    let entry: CacheEntry
    init(entry: CacheEntry) { self.entry = entry }
}

enum CacheEntry {
    case inProgress(Task<QuakeLocation, Error>)
    case ready(QuakeLocation)
}
