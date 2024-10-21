//
//  ContentView.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 8.10.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        ZStack {
            TabView {
                QuestionListView()
                    .tabItem {
                        Label("Question List", systemImage: "list.dash")
                    }
                
                QuizView()
                    .tabItem {
                        Label("Quiz", systemImage: "questionmark")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
        
}
