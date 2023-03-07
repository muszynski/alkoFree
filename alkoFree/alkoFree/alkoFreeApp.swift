//
//  alkoFreeApp.swift
//  alkoFree
//
//  Created by Łukasz Muszyński on 05/03/2023.
//

import SwiftUI

@main
struct alkoFreeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
