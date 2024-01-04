//
//  TodoListItemsView.swift
//  CoconutList
//
//  Created by Sebastian on 2023/12/31.
//

import SwiftUI

struct TodoListItemsView: View {
    @StateObject var viewModel = TodoListItemsViewViewModel()
    let item: TodoListItem
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    TodoListItemsView(item: TodoListItem(id: "123", title: "Get milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
}
