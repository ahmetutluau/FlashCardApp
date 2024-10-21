//
//  CoordinatorView.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 21.10.2024.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .main)
                .navigationDestination(for: AppPages.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.buildSheet(sheet: sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { cover in
                    coordinator.buildCover(cover: cover)
                }
        }
        .environmentObject(coordinator)
    }
}
