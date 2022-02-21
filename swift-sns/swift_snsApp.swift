//
//  swift_snsApp.swift
//  swift-sns
//
//  Created by yoshikinaruo on 2022/02/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
@main
struct swift_snsApp: App {
    init(){
         FirebaseApp.configure()
     }
     var body: some Scene {
         WindowGroup {
             if Auth.auth().currentUser != nil  {
              Home()
             }
             else{
              RegistarScreens()
             }
         }
     }
}
