//
//  TodoListItemView.swift
//  ToDoList
//
//  Created by Brayan burgos on 6/10/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = TodoListItemViewModelView()
    let item: Item
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.tittle) 
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item : item)
            }label:{
                Image(systemName: item.isDone ? "checkmark.circle.fill": "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

    struct ToDoListItemView_Previews: PreviewProvider{
        static var previews: some  View{
            ToDoListItemView(item: .init(
                id: "123",
                tittle: "Get milk",
                dueDate: Date().timeIntervalSince1970,
                createdDate:
                    Date().timeIntervalSince1970,
                isDone: true))
        }
    }
