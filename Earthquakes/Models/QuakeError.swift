//
//  QuakeError.swift
//  Earthquakes-iOS
//
//  Created by Aleksei Morozow on 30.07.2025.
//  Copyright © 2025 Apple. All rights reserved.
//

import Foundation

enum QuakeError: Error {
    case missingData
}

extension QuakeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString(
                "Found and will discard a quake missing a valid code, magnitude, place, or time.",
                comment: "")
        }
    }
}
