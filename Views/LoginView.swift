import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModelView()
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List", subtitle: "Get Things Done", angle: 15, background: .green)
                
                //Login Form
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(tittle: "Log In", background: .blue){
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y:-50)
                
                
                // Create account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegistrationView())
                    .padding(.bottom, 50)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}

