//
//  QuizView.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 8.10.2024.
//

import SwiftUI
import SwiftData

struct QuizView: View {
    @State var backDegree = 90.0
    @State var frontDegree = 0.0
    @State var isFlipped = false
    let durationAnddelay: CGFloat = 0.2
    
    @State var questionNumber = 0
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        VStack {
            ZStack {
                CardFrontView(degree: $frontDegree, textContext: items[questionNumber].question)
                CardBackView(degree: $backDegree, textContext: items[questionNumber].answer)
            }
            .onTapGesture {
                flipCard()
            }
            
            HStack {
                if questionNumber > 0 {
                    Button(action: {
                        if !isFlipped {
                            flipCard()
                        }
                        questionNumber -= 1
                    }, label: {
                        Text("< Previous")
                    })
                    .frame(maxWidth: .infinity)
                } else {
                    Text("< Previous")
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.secondary)
                }
                
                Text("Card \(questionNumber + 1) of \(items.count)")
                
                if questionNumber < (items.count - 1) {
                    Button(action: {
                        if !isFlipped {
                            flipCard()
                        }
                        questionNumber += 1
                    }, label: {
                        Text("Next >")
                    })
                    .frame(maxWidth: .infinity)
                } else {
                    Text("Next >")
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
        }
    }
    
    // MARK: - Functions
    private func flipCard() {
        isFlipped.toggle()
        
        if isFlipped {
            withAnimation(.linear(duration: durationAnddelay)) {
                backDegree = 90
            }
            
            withAnimation(.linear(duration: durationAnddelay)) {
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAnddelay)) {
                frontDegree = -90
            }
            
            withAnimation(.linear(duration: durationAnddelay)) {
                backDegree = 0
            }
        }
    }
}

#Preview {
    QuizView()
        .modelContainer(previewContainer)
}


