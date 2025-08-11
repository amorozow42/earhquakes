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
    case networkError
    case unexpectedError
}

extension QuakeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString(
                "Found and will discard a quake missing a valid code, magnitude, place, or time.",
                comment: "")
        case .networkError:
            return NSLocalizedString(
                "Something went wrong due network reauest.",
                comment: "")
        case .unexpectedError:
            return NSLocalizedString(
                "Unknown error.",
                comment: "")
        }
    }
}
