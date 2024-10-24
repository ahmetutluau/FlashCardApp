//
//  AddNewCategoryScreen.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 24.10.2024.
//

import SwiftUI

struct AddNewCategoryScreen: View {
    @State var categoryName: String = ""
    @Environment(\.dismiss) var dismiss
    @FocusState private var focused: Bool
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Dismiss")
                })
                .padding()
            }
            
            
            Spacer()
            
            TextField("Category name", text: $categoryName)
                .frame(height: 50)
                .background(.gray.opacity(0.1))
                .padding(.horizontal)
                .clipShape(.capsule)
                .focused($focused)
                
            Spacer()
            
            HStack(spacing: 30) {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Cancel")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                })
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .buttonStyle(.bordered)
                .tint(.red)
                .clipShape(.capsule)
                
                Button(action: {
                    //save category
                    addCategory()
                }, label: {
                    Text("Save")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                })
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(categoryName != "" ? .mainButtonBG : .gray.opacity(0.4))
                .clipShape(.capsule)
                .tint(.white)
                .disabled(categoryName != "" ? false : true)
            }
            .padding()
        }
        .onAppear(perform: {
            self.focused = true
        })
    }
    
    // MARK: - Functions
    
    private func addCategory() {
        guard categoryName != "" else {return}
        let newItem = Category(name: categoryName)
        modelContext.insert(newItem)
        dismiss()
        coordinator.push(page: .main)
    }
}

#Preview {
    AddNewCategoryScreen()
}
