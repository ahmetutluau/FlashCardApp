//
//  QuestionListView.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 8.10.2024.
//

import SwiftUI
import SwiftData

struct HomeScreen: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    @Environment(\.modelContext) private var modelContext
    @Query private var categories: [Category]
    @Query private var decks: [Deck]
    
    @State var showAddQuestionView: Bool = false
    
    var body: some View {
        VStack {
            HStack(content: {
                Spacer()
                
                EditButton()
                
                Button(action: {
                    coordinator.presentSheet(.addQuestion)
                }) {
                    Image(systemName: "plus")
                }
                .padding(.horizontal)
            })
            List {
                ForEach(categories) { category in
                    Section {
                        ForEach(category.decks) { deck in
                            Text(deck.name)
                        }
                    } header: {
                        Text(category.name.capitalized)
                    }
                }
                
                Section {
                    ForEach(decks) { deck in
                        Text(deck.name)
                    }
                }
            }

        }
        
    }
    
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    HomeScreen()
        .modelContainer(previewContainer)
        .environmentObject(Coordinator())
}
