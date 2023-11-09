//
//  TodoListItemsView.swift
//  ToDoList
//
//  Created by Brayan burgos on 6/10/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewModelView
    @FirestoreQuery var items: [Item]
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos"
        )
        
        self._viewModel = StateObject(wrappedValue: TodoListViewModelView(userId: userId)
        )
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id:  item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    //Action
                    viewModel.showingNewItemView = true 
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemIsPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct TodoListItemsView_Previews: PreviewProvider{
    static var previews: some View {
        TodoListView(userId: "v9SRaQbsfffkDSLT3mjR7iBj3U03")
    }
}
