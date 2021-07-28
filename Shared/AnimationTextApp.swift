//
//  AnimationTextApp.swift
//  Shared
//
//  Created by Seyyed Parsa Neshaei on 7/28/21.
//

import SwiftUI

@main
struct AnimationTextApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
