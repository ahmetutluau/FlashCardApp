//
//  AddQuestionView.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 8.10.2024.
//

import SwiftUI
import SwiftData

enum Categories: String, CaseIterable, Identifiable {
    case Language , Movies, Science, Mathematics, History, Geography, Music, Art, Literature, Technology
    var id: Self { self }
}

struct AddDeckScreen: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State var questionString = ""
    @State var answerString = ""
    @Environment(\.dismiss) var dismiss
    
    @State private var skipCategory: Bool = false
    
    @State private var selectedCategory: Categories = .Language
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        Form {
            Section("Name") {
                HStack {
                    TextField("Type your question here", text: $questionString)
                    Text("*").foregroundStyle(.red)
                }
            }
            
            Section("Category(Optional)") {
                VStack(alignment: .leading, content: {
                    Toggle("Skip", isOn: $skipCategory)
                                        
                    Picker(selection: $selectedCategory, label: Text("Select Category").foregroundColor(skipCategory ? .gray : .black)) {
                        ForEach(Categories.allCases) { category in
                            Text(category.rawValue.capitalized)
                        }
                    }
                            
                })
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
    AddDeckScreen()
}
