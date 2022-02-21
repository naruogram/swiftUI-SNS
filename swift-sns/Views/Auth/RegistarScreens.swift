//
//  RegistarScreens.swift
//  swift-sns
//
//  Created by yoshikinaruo on 2022/02/22.
//

import SwiftUI

import SwiftUI
import Firebase
import FirebaseAuth
struct RegistarScreens: View {
    @State var name = ""
    @State var email = ""
    @State var passward = ""
    @State private var judge = false
    @State private var isLogin = false
    let ref = Firestore.firestore()
    var body: some View {
        NavigationView {
            VStack{
                Text("We are Tech.Uni")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image("techuni")
                VStack{
                    TextField("your name",text:$name)
                        .padding()
                    
                    
                    TextField("email address", text: $email)
                        .padding()
                    
                    SecureField("passward",text:$passward)
                        .padding()
                }
                .font(.title3)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(50.0)
                .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                .padding(.vertical)
                
                NavigationLink(destination: Home(), isActive: $judge) {
                    EmptyView()
                }
                NavigationLink(destination: LoginScreens(), isActive: $isLogin) {
                    EmptyView()
                }
                
                Button(action: {
                    registar()
                }
                ){
                    Text("登録する")
                        .foregroundColor(Color.white)
                        .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                    
                }
                
                Button(action: {
                    isLogin.toggle()
                }
                ){
                    Text("ログイン")
                        .foregroundColor(Color.white)
                        .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                }
            }
            
            .padding()
        }
    }
    
    func registar(){
        Auth.auth().createUser(withEmail: email, password:passward) { result, error in
            if error == nil {
                judge.toggle()
                let user = Auth.auth().currentUser
                Firestore.firestore().collection("users").document(user!.uid).setData(
                    [
                        "name": self.name,
                        "email": self.email
                    ])
            }
        }
    }
    
    struct RegistarScreens_Previews: PreviewProvider {
        static var previews: some View {
            RegistarScreens()
        }
    }
}
