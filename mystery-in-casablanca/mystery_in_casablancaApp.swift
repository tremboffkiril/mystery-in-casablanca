//
//  mystery_in_casablancaApp.swift
//  mystery-in-casablanca
//
//  Created by Kiril Trembovetskyi on 15.01.2025.
//

import SwiftUI

@main
struct mystery_in_casablancaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
