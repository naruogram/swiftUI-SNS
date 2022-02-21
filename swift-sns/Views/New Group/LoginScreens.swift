//
//  LoginScreens.swift
//  swift-sns
//
//  Created by yoshikinaruo on 2022/02/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
struct LoginScreens: View {
    @State var name = ""
    @State var email = ""
    @State var passward = ""
    @State var judge = false
    @State var isRegistar = false
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                Text("I Love Shouhi")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                Image("techuni")
                }
                .padding(.bottom, 30)
                VStack{
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
                NavigationLink(destination: LoginScreens(), isActive: $isRegistar) {
                    EmptyView()
                }
                
                Button(action: {
                    login()
                }
                ){
                    Text("ログイン")
                        .foregroundColor(Color.white)
                    
                }.font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(50.0)
                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                    .padding(.vertical)
            }
            .padding()
        
        }
    }
    func login(){
        
        Auth.auth().signIn(withEmail: email, password:passward){(result,error) in
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else{
                judge.toggle()
                print("ログイン成功")
            }
        }
    }
    
    struct LoginScreens_Previews: PreviewProvider {
        static var previews: some View {
            LoginScreens()
        }
    }
}
