//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Philipp Sanktjohanser on 23.12.22.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
