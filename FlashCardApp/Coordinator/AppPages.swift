//
//  AppPages.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 21.10.2024.
//

import Foundation

enum AppPages {
    case main
}

enum Sheet: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case addQuestion
}

enum FullScreenCover: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case placeHolder // empty
}
