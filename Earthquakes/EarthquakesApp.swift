/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The app and main window group scene.
*/

import SwiftUI

@main
struct EarthquakesApp: App {
    @State var quakesProvider = QuakesProvider()

    var body: some Scene {
        WindowGroup {
            Quakes()
                .environment(quakesProvider)
        }
    }
}
