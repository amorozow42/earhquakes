//
//  TestDownloader.swift
//  Earthquakes-iOS
//
//  Created by Aleksei Morozow on 08.08.2025.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation

struct TestDownloader: HTTPDataDownloader {
    func fetchData(from: URL) async throws -> Data {
        try await Task.sleep(for: .milliseconds(.random(in: 100...500)))
        return testQuakeData
    }
}
