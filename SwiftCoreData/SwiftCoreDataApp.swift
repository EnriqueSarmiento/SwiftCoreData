//
//  SwiftCoreDataApp.swift
//  SwiftCoreData
//
//  Created by Enrique Sarmiento on 26/4/24.
//

import SwiftUI

@main
struct SwiftCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
