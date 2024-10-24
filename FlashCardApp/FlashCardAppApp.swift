//
//  FlashCardAppApp.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 8.10.2024.
//

import SwiftUI
import SwiftData

@main
struct FlashCardAppApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
        }
        .modelContainer(for: Category.self)
    }
}
