/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A structure for representing quake data.
*/

import Foundation
import SwiftUI

struct Quake: Identifiable {
    let magnitude: Double
    let place: String
    let time: Date
    let code: String
    let detail: URL
    
    var id: String { code }
    
    var color: Color {
        switch magnitude {
        case 0..<1:
            return .green
        case 1..<2:
            return .yellow
        case 2..<3:
            return .orange
        case 3..<5:
            return .red
        case 5..<Double.greatestFiniteMagnitude:
            return .init(red: 0.8, green: 0.2, blue: 0.7)
        default:
            return .gray
        }
    }
}
