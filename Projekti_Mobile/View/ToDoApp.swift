//
//  ToDoApp.swift
//  Projekti_Mobile
//
//  Created by user253361 on 2/22/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoApp: App{
    var body: some Scene{
        WindowGroup{
            ContentView()
        }
        .modelContainer(for: ReminderList.self)
    }
}
