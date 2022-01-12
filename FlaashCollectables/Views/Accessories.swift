//
//  Home.swift
//  FlaashCollectables
//
//  Created by George Killeen on 08/01/2022.
//

import SwiftUI
import Firebase

struct Accessories: View {
    
    @AppStorage("log_Status") var status = false
    
    @Binding var loggedIn: Int
    
    //Creating a storage for my navbar items to be stored
    let options: [Option] = [
        .init(title: "Inventory", imageName: "folder.circle", sectionID: 1),
        .init(title: "Card Singles", imageName: "1.circle", sectionID: 2),
        .init(title: "Card Bundles", imageName: "gift.circle", sectionID: 3),
        .init(title: "Graded Cards", imageName: "10.circle", sectionID: 4),
        .init(title: "Sealed Product", imageName: "archivebox.circle", sectionID: 5),
        .init(title: "Accessories", imageName: "star.circle", sectionID: 6),
        .init(title: "Financials", imageName: "sterlingsign.circle", sectionID: 7),
        .init(title: "Sales", imageName: "cart.circle", sectionID: 8),
        .init(title: "Monthly Figures", imageName: "doc.circle", sectionID: 9),
        .init(title: "Business Tools", imageName: "link.circle", sectionID: 10),
        .init(title: "Buying Calculator", imageName: "b.circle", sectionID: 11),
        .init(title: "Profit Calculator", imageName: "p.circle", sectionID: 12),
        .init(title: "Account", imageName: "person.circle", sectionID: 13)
    ]
    
    var body: some View {
        //Setting up the screen size and properties
        let width = getRect().width / 1.6
        
        HStack(spacing: 0){
            VStack(alignment: .leading, spacing: 18, content: {
                
                //Adding the navbar...
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {loggedIn = 0}){
                    Text("Flaash\nCollectables")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                }
                Divider()
                //Spacer()
                //Displaying my navbar items
                VStack(alignment: .leading){
                    ForEach(options, id: \.self){ option in
                        HStack{
                            Button(action:{loggedIn = option.sectionID}){
                            Image(systemName: option.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                            
                            Text(option.title)
                                    .font(.system(size: 14))
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                //.padding()
                //Spacer()
                Divider()
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
            
            //Image background for main content...
            ZStack{
                Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width/1.4)
                    .clipped()
                    .zIndex(0)
                
                //Adding the heading tile...
                ZStack(alignment: .leading){
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color.black.opacity(0.8))
                        .frame(width: 200, height: 50)
                        .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white.opacity(0.8), lineWidth: 1))
                        .overlay(VStack{
                            Text("Accessories")
                            .font(.largeTitle)
                        })
  
                        .padding(10)
                    
                }
                .frame(width: width/1.4, height: getRect().height - 180, alignment:
                            .topLeading)
                
                //Adding the tile to add stock...
                ZStack(alignment: .leading){
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color.black.opacity(0.8))
                        .frame(width: (width/1.4 - 20)*0.4 - 5, height: getRect().height - 250)
                        .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white.opacity(0.8), lineWidth: 1))
                        .overlay(
                            VStack{
                                Text("Add Cards")
                                    .font(.system(size: 30))
                                Divider()
                                Spacer()
                            }.padding(10))
 
                        .padding(10)
                        .padding(.leading, (width/1.4 - 20)*0.6 + 5)
                        .padding(.top, 60)
                
                }
                .frame(width: width/1.4, height: getRect().height - 180, alignment:
                            .topLeading)
                
                //Adding the main info tile...
                ZStack(alignment: .leading){
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color.black.opacity(0.8))
                        .frame(width: (width/1.4 - 20)*0.6 - 5, height: getRect().height - 250)
                        .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white.opacity(0.8), lineWidth: 1))
                        .overlay(
                            VStack{
                                Text("Stock List")
                                    .font(.system(size: 30))
                                Divider()
                                Spacer()
                            }.padding(10))
 
                        .padding(10)
                        .padding(.top, 60)
                
                }
                .frame(width: width/1.4, height: getRect().height - 180, alignment:
                            .topLeading)
                
                ZStack{
                    
                    //Creating the tile to show whos logged in...
                    ZStack (alignment: .leading){
                        //The tile
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.black.opacity(0.4))
                            .frame(width: 200, height: 50)
                            .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white.opacity(0.8), lineWidth: 1))
                            .overlay(
                                //Adding who's logged in...
                                Text("Accessories")
                                    .padding(.leading, 25))
                            .padding(10)
                        
                        //Tile content...
                        Circle()
                            .fill(Color.white)
                            .frame(width: 70, height: 40)
                        //Profile Image...
                            .overlay(Image(systemName: "person.circle")
                                        .foregroundColor(.black)
                                        .font(.system(size: 35)))
                        
                        
                    }
                    .frame(width: width/1.4, height: getRect().height - 180, alignment:
                                .topTrailing)
                }
                
            }
            
        }
        .ignoresSafeArea()
        .frame(width: width, height: getRect().height - 180)
        .colorScheme(.dark)

    }
}


