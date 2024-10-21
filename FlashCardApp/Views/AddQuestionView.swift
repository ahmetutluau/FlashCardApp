//
//  AddQuestionView.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 8.10.2024.
//

import SwiftUI
import SwiftData

struct AddQuestionView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State var questionString = ""
    @State var answerString = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section("Question") {
                HStack {
                    TextField("Type your question here", text: $questionString)
                    Text("*").foregroundStyle(.red)
                }
            }
            
            Section("Answer") {
                HStack {
                    TextField("Type your answer here", text: $answerString)
                    Text("*").foregroundStyle(.red)
                }
            }
            
            Section {
                HStack {
                    Button(action: {
                        print("watch")
                        dismiss()
                    }, label: {
                        Text("Cancel")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .padding(.vertical, 5)
                    })
                    .background(.red)
                    .cornerRadius(25)
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Spacer()
                    
                    if answerString != "" && questionString != "" {
                        Button(action: {
                            //save
                            addItem()
                            
                        }, label: {
                            Text("Save")
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.white)
                                .padding(.vertical, 5)
                        })
                        .background(.blue)
                        .cornerRadius(25)
                        .buttonStyle(BorderlessButtonStyle())
                    } else {
                        Text("Save")
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }
       
    // MARK: - Functions
    
    private func addItem() {
        withAnimation {
            guard answerString != "" && questionString != "" else {return}
            let newItem = Item(question: questionString,
                               answer: answerString)
            modelContext.insert(newItem)
            dismiss()
        }
    }
}

#Preview {
    AddQuestionView()
}
