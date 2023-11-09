//
//  NewItemView.swift
//  ToDoList
//
//  Created by Brayan burgos on 6/10/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModelView()
    @Binding var newItemIsPresented: Bool 
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Form{
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(tittle: "Save",
                         background: .pink) {
                    if viewModel.canSave{
                        viewModel.save()
                        newItemIsPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert){
                    Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date newer than is today or newer."))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider{
    static var previews: some View{
        NewItemView(newItemIsPresented: Binding(get:{
            return true
        }, set:{ _ in

        }))
    }
}
