//
//  Category.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 22.10.2024.
//

import Foundation
import SwiftData

@Model
final class Category {
    @Attribute(.unique) var name: String
    var decks: [Deck]
    
    init(name: String, decks: [Deck] = []) {
        self.name = name
        self.decks = decks
    }
}

@Model
final class Deck {
    @Attribute(.unique) var name: String
    var category: Category?
    @Relationship(deleteRule: .cascade) var flashCards: [FlashCard]
    
    init(name: String, category: Category? = nil, flashCards: [FlashCard] = []) {
        self.name = name
        self.category = category
        self.flashCards = flashCards
    }
}

@Model
final class FlashCard {
    var question: String
    var answer: String
    var deck: Deck
    var creationDate: Date
    
    init(question: String, answer: String, deck: Deck, creationDate: Date = .now) {
        self.question = question
        self.answer = answer
        self.deck = deck
        self.creationDate = creationDate
    }
}
