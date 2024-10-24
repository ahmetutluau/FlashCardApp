//
//  PreviewDataController.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 22.10.2024.
//

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Category.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        for category in SampleDeck.categories {
            for deck in SampleDeck.decks {
                container.mainContext.insert(deck)
                
                let flashcard = FlashCard(question: "Who did X?", answer: "X was done by Y", deck: deck)
                container.mainContext.insert(flashcard)
                deck.flashCards.append(flashcard)
            }
            container.mainContext.insert(category)
        }
        
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()

struct SampleDeck {
    static var categories: [Category] = [
        Category(name: "Math"),
        Category(name: "Science"),
        Category(name: "Japanese"),
    ]
    
    static var decks: [Deck] = [
        Deck(name: "Beginner"),
        Deck(name: "Intermediate"),
        Deck(name: "Advanced")
    ]
    
//    static var deck: Deck { Deck(name: "Japanese") }
//    static var flashcard: FlashCard = FlashCard(question: "Nodo", answer: "Throat", deck: Self.deck)
}
