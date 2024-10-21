//
//  QuestionListView.swift
//  FlashCardApp
//
//  Created by Ahmet Utlu on 8.10.2024.
//

import SwiftUI
import SwiftData

struct QuestionListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State var showAddQuestionView: Bool = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    Text("\(item.question)")
                        .font(.headline)
                    + Text("\n\(item.answer)")
                        .font(.subheadline)
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {showAddQuestionView = true}) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        .navigationTitle("Questions")
        .sheet(isPresented: $showAddQuestionView, content: {
            AddQuestionView()
        })
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    QuestionListView()
        .modelContainer(PreviewDataController.container)
}

@MainActor
class PreviewDataController {
    static let container: ModelContainer = {
        do {
            let todoItemTitles = [
                Item(question: "A", answer: "a"),
                Item(question: "B", answer: "b"),
                Item(question: "C", answer: "c"),
                Item(question: "D", answer: "d")
            ]
            let container = try ModelContainer(for: Item.self, configurations: ModelConfiguration (isStoredInMemoryOnly: true))
            
            for index in 0..<4 {
                let todoItem = Item(question: todoItemTitles[index].question,
                                answer: todoItemTitles[index].answer)
                container.mainContext.insert(todoItem)
            }
            
            return container

            } catch {
                fatalError("Unable to initialize a container for previews.")
            }
    }()
}