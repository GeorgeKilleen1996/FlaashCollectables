//
//  FirebaseManager.swift
//  FlaashCollectables
//
//  Created by George Killeen on 17/01/2022.
//

import SwiftUI
import Firebase
import Foundation

class FirebaseManager: ObservableObject {
    
    //Stock variables...
    //Continuous Properties
    @Published var iTitle = ""
    @Published var iQuantity = ""
    @Published var iBoughtFor = ""
    @Published var iSellingFor = ""
    @Published var iType = ""
    
    @Published var iSetName = ""
    @Published var iSetNumber = ""
    
    
    //Whenever a user is created, their details are added to the database...
    func addUser(userEmail: String, userFName: String, userLName: String){
        
        //Creating user variables...
        let docData: [String: Any] = [
            "email": userEmail,
            "fname": userFName,
            "lname": userLName,
            "dateAdded": Timestamp(date: Date()),
        ]
        
        //Setting up the database link...
        let db  = Firestore.firestore()
        let docRef = db.collection("Users").document(userEmail)
        
        //Adding the data...
        docRef.setData(docData){ error in
            if let error = error{
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    //Adding stock to the database...
    func addStock(){
        
        //Creating stock variables...
        let docData: [String: Any] = [
            "item_name": iTitle,
            "set_name": iSetName,
            "set_number": iSetNumber,
            "bought_for": iBoughtFor,
            "selling_price": iSellingFor,
            "quantity": iQuantity,
            "type": iType,
        ]
        
        //Setting up the database link...
        let db  = Firestore.firestore()
        let docRef = db.collection("Stock").document(iTitle)
        
        //Adding the data...
        docRef.setData(docData){ error in
            if let error = error{
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
}
