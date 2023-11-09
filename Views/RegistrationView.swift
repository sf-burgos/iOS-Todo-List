//
//  RegistrationView.swift
//  ToDoList
//
//  Created by Brayan burgos on 6/10/23.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModelView()
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start Organizing Todos", angle: -15, background: .green)
                
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(tittle: "Create Account", background: .green){
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            Spacer()
        
        }
    }
}

#Preview {
    RegistrationView()
}
