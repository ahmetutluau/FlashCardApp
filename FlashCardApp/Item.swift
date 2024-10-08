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
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
