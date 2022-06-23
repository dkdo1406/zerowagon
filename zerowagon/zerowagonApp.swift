//
//  zerowagonApp.swift
//  zerowagon
//
//  Created by Hyeongjung on 2022/05/09.
//

import SwiftUI

@main
struct zerowagonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
