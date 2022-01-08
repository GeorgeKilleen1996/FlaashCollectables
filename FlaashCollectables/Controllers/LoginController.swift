//
//  LoginController.swift
//  FlaashCollectables
//
//  Created by George Killeen on 08/01/2022.
//

import SwiftUI
import Firebase

class LoginController: ObservableObject {
    
    //Login Properties
    @Published var username = ""
    @Published var password = ""
    
    
    //Register Properties
    @Published var isNewUser = false
    @Published var regUsername = ""
    @Published var regPassword = ""
    @Published var regPasswordTwo = ""
    @Published var regFirstName = ""
    @Published var regLastName = ""
    
    //Loading Screen
    
    @Published var isLoading = false
    
    //Error handling
    
    @Published var errorMessage = ""
    @Published var error = false
    
    //Log Status
    
    @AppStorage("log_Status") var status = false
    
    
    //Controller Functions...
    
    func loginUser(){
        
        //Adding the loading screen...
        withAnimation{isLoading = true}
        
        Auth.auth().signIn(withEmail: username, password: password) {[self] (result, err) in
            
            if let error = err{
                errorMessage = error.localizedDescription
                self.error.toggle()
                return
            }
            
            guard let _ = result else{
                errorMessage = "Please try again later!"
                error.toggle()
                return
            }
            errorMessage = "User Successfully Logged In!"
            error.toggle()
            withAnimation{status = true}
        }
    }
    
    func registerUser(){
        
        //Loading Screen...
        withAnimation{isLoading = true}
        
        Auth.auth().createUser(withEmail: regUsername, password: regPassword) { [self] (result, err) in
            
            if let error = err{
                errorMessage = error.localizedDescription
                self.error.toggle()
                return
            }
            
            guard let _ = result else{
                errorMessage = "Please try again later!"
                error.toggle()
                return
            }
            errorMessage = "New User Successfully Created!"
            error.toggle()
            withAnimation{isNewUser = false}
        }
        
    }
}

