//
//  DearestApp.swift
//  Dearest
//
//  Created by Julia Kansbod on 2023-01-06.
//

import SwiftUI

@main
struct DearestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
