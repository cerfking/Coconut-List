//
//  TodoListView.swift
//  CoconutList
//
//  Created by Sebastian on 2023/12/31.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemsView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                            
                        }
                }
                .listStyle(.plain)
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    TodoListView(userId: "xTvPUEsmxIVfy92EwLDP4sfdDZ43")
}
