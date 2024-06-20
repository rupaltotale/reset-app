//
//  resetApp.swift
//  reset
//
//  Created by Rupal Totale on 6/19/24.
//

import SwiftUI

@main
struct resetApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
