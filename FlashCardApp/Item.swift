//
//  Item.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 8.10.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var question: String
    var answer: String
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
}

