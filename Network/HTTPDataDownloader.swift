//
//  HTTPDataDownloader.swift
//  Earthquakes-iOS
//
//  Created by Aleksei Morozow on 08.08.2025.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation

let validStatus = 200...299

protocol HTTPDataDownloader: Sendable {
    func fetchData(from: URL) async throws -> Data
}

extension URLSession: HTTPDataDownloader {
    func fetchData(from url: URL) async throws -> Data {
        let (data, response) = try await self.data(from: url, delegate: nil)
        let httpStatus = response as? HTTPURLResponse
        
        guard httpStatus != nil && validStatus.contains(httpStatus!.statusCode) else {
            throw QuakeError.networkError
        }
        
        return data
    }
}
