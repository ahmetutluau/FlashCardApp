//
//  Coordinator.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 21.10.2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    func push(page: AppPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func presentFullSecreenCover(_ cover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .main:
            ContentView()
        }
    }
    
    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .addQuestion:
                AddDeckScreen()
        case .addNewCategory:
            AddNewCategoryScreen()
        }
    }
    
    func buildCover(cover: FullScreenCover) -> some View {
        switch cover {
        case .placeHolder:
            EmptyView()
        }
    }
}
