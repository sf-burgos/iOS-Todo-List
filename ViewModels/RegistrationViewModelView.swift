
import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegistrationViewModelView: ObservableObject{
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init(){}
    
    public func register(){
        guard validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in guard let userId = result?.user.uid else {
                return
            }
            self.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id : id,
                           name: name,
                            email: email,
                           joined: Date().timeIntervalSince1970)
        
        let dataBase = Firestore.firestore()
        
        dataBase.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    private func validate() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        return true
        
            
    }
    
}
