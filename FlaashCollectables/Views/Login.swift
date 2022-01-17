//
//  Login.swift
//  FlaashCollectables
//
//  Created by George Killeen on 08/01/2022.
//

import SwiftUI

struct Login: View {
    //Linking to the controller
    @StateObject var loginData = LoginController()
    @StateObject var newUser = FirebaseManager()
    
    var body: some View {
        
        //Setting up the screen size and properties
        let width = getRect().width / 1.6
        
        HStack(spacing: 0){
            VStack(alignment: .leading, spacing: 18, content: {
                
                //Adding the Login View...
                Spacer()
                Text("Flaash \nCollectables")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    
                //If Register hasnt been clicked then login...
                if(!loginData.isNewUser){
                    //Custom Textfields...
                    VStack(alignment: .leading, spacing: 6, content: {
                        Text("Username")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        TextField("FlaashCollectables@Flaash.co.uk", text: $loginData.username)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.white.opacity(0.13))
                            .cornerRadius(8)
                    })
                    
                    VStack(alignment: .leading, spacing: 6, content: {
                        Text("Password")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        SecureField("**********", text: $loginData.password)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.white.opacity(0.13))
                            .cornerRadius(8)
                    })
                    
                    //Buttons...
                    
                    Button(action: { loginData.loginUser()}, label:{
                        Text("Login")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(10)
                    })
                    .padding(.top)
                    //The login button is disabled if no data has been entered...
                    .disabled(loginData.username == "" || loginData.password == "")
                    .opacity((loginData.username == "" || loginData.password == "") ? 0.6 : 1)
                    
                    Button(action:
                        //Opening the register section
                        {withAnimation{loginData.isNewUser.toggle()}}, label:{
                        Text("Register")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    })
                }
                //if a user needs to register an account...
                else{
                    //Go back button
                    
                    Button(action: {withAnimation{loginData.isNewUser.toggle()}}, label: {
                        Label(
                            title: { Text("GO BACK")
                                    .fontWeight(.semibold)
                            },
                            icon: {Image(systemName: "chevron.left")})
                            .font(.caption)
                            .foregroundColor(.gray)
                    })
                        
                    //Adding the Register Text Fields...
                    
                    Text("First Name")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    TextField("e.g. George", text: $loginData.regFirstName)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.13))
                        .cornerRadius(8)
                    
                    Text("Last Name")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    TextField("e.g. Killeen", text: $loginData.regLastName)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.13))
                        .cornerRadius(8)
                    
                    Text("Username")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    TextField("e.g. GKilleen@Gmail.co.uk", text: $loginData.regUsername)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.13))
                        .cornerRadius(8)
                    
                    Text("Password")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    SecureField("**********", text: $loginData.regPassword)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.13))
                        .cornerRadius(8)
                    
                    Button(action: {loginData.registerUser()
                        if(loginData.correctData)
                        {
                        newUser.addUser(userEmail: loginData.regUsername, userFName: loginData.regFirstName, userLName: loginData.regLastName)
                        }
                    }, label:{
                        Text("Register")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(10)
                    })
                    .disabled(loginData.regUsername == "" || loginData.regPassword == "" || loginData.regFirstName == "" || loginData.regLastName == "")
                    .opacity((loginData.regUsername == "" || loginData.regPassword == "" || loginData.regFirstName == "" || loginData.regLastName == "") ? 0.6 : 1)
                    .padding(.top)
                    
                }
                
                Spacer()
                HStack(alignment: .center){
                Spacer()
                Text("George Killeen")
                    .foregroundColor(.white.opacity(0.2))
                Spacer()
                }
                
            })
            .buttonStyle(PlainButtonStyle())
            .textFieldStyle(PlainTextFieldStyle())
            .padding()
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .zIndex(1)
            
            //Image for the login page...
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width/1.6)
                .clipped()
                .zIndex(0)
        }
        .ignoresSafeArea()
        .overlay(ZStack{if loginData.isLoading {LoadingScreen()}})
        .frame(width: width, height: getRect().height - 180)
        .colorScheme(.dark)
        //Displaying the error/success messages upon login/register attempts
        .alert(isPresented: $loginData.error, content: { Alert(title: Text("Message"), message: Text(loginData.errorMessage), dismissButton: .destructive(Text("Close"), action:{
            withAnimation{loginData.isLoading = false}
            }))
        })
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

//Extending view to get screen rect...

extension View{
    
    func getRect()->CGRect{
        return  NSScreen.main!.visibleFrame
    }
}
