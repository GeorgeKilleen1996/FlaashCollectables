//
//  Home.swift
//  FlaashCollectables
//
//  Created by George Killeen on 08/01/2022.
//

import SwiftUI
import Firebase

struct Home: View {
    
    @AppStorage("log_Status") var status = false
    
    var body: some View {
        //Setting up the screen size and properties
        let width = getRect().width / 1.6
        
        HStack(spacing: 0){
            VStack(alignment: .leading, spacing: 18, content: {
                
                //Adding the Login View...
                
                Text("Flaash \nCollectables")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    
                Spacer()
                
                Button(action:{
                    try? Auth.auth().signOut()
                    withAnimation{status = false}
                }, label: {
                    Text("Sign Out")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.23))
                        .cornerRadius(10)
                })
                .buttonStyle(PlainButtonStyle())
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
                .frame(width: width/1.4)
                .clipped()
                .zIndex(0)
        }
        .ignoresSafeArea()
        .frame(width: width, height: getRect().height - 180)
        .colorScheme(.dark)

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
