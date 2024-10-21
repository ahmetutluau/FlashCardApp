//
//  CardFrontView.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 8.10.2024.
//

import SwiftUI

struct CardFrontView: View {
    @Binding var degree: Double
    var textContext: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.green.opacity(0.5), lineWidth: 10.0)
                .padding()
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.green.opacity(0.1))
                .padding()
            
            VStack {
                Text("Question:")
                    .font(.title)
                
                Text(textContext)
                    .font(.title)
                    .lineLimit(10)
                    .multilineTextAlignment(.center)
                    .padding(25)
            }
        }
        .rotation3DEffect(
            Angle(degrees: degree),
                                  axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}

#Preview {
    CardFrontView(degree: .constant(0.0), textContext: "question string goes here")
}
