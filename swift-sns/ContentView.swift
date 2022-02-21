//
//  ContentView.swift
//  swift-sns
//
//  Created by yoshikinaruo on 2022/02/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
struct ContentView: View {
    @State var email = ""
    @State var passward = ""
    @State var judgeLogin="ログイン"
    var body: some View {
          VStack{
              TextField("Email",text:$email)
              SecureField("passward",text:$passward)
              Button(action: {
                  if Auth.auth().currentUser != nil {
                  login()
                  }
                  else{
                   registar()
                  }
                  }
              ){
                  Text(judgeLogin)
              }
          }
           .padding()
      }
    func login(){
            
       Auth.auth().signIn(withEmail: email, password:passward){(result,error) in
               if error != nil{
                   print(error?.localizedDescription ?? "")
               }else{
                   print("ログイン成功")
               }
          }
    }
    func registar(){
        Auth.auth().createUser(withEmail: email, password:passward) { result, error in
    if error == nil {
       print("ユーザー登録")
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

