//
//  Home.swift
//  swift-sns
//
//  Created by yoshikinaruo on 2022/02/22.
//

import SwiftUI
import FirebaseAuth
import Firebase
struct Home: View {
    @State var logOut = false
    @State var userModel=[]
     
    init(){
        let uid = Auth.auth().currentUser?.uid
        Firestore.firestore().collection("users").document(uid).getDocument { (snap, error) in
            // ここは通信が終わったら呼ばれる！
            var modelList: [Model] = []
            for data in snap!.data()! {
                let model = Model(data: data)
                modelList.append(model)
            }
            self.modelList = modelList
            self.tableView.reloadData()
        }    }
    var body: some View {
        NavigationView {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            NavigationLink(destination: LoginScreens(), isActive: $logOut) {
                EmptyView()
            }
      
//            print("処理が始まったよー！")
//

            Button(action: {
                logout()
            }){
                Text("ログアウト")
            }
        }
    }
    }
    
    func logout(){
        do{
            logOut.toggle()
            try Auth.auth().signOut()
        }catch let error as NSError{
            print(error)
        }
    }
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
}
