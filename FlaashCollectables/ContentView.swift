//
//  ContentView.swift
//  FlaashCollectables
//
//  Created by George Killeen on 08/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("log_Status") var status = false
    
    @State var loggedIn = 0
    
    var body: some View {
        
        if(status){
            
            switch loggedIn{
            case 0:
                Home(loggedIn: $loggedIn)
            case 1:
                Inventory(loggedIn: $loggedIn)
            case 2:
                CardSingles(loggedIn: $loggedIn)
            case 3:
                CardBundles(loggedIn: $loggedIn)
            case 4:
                GradedCards(loggedIn: $loggedIn)
            case 5:
                SealedProduct(loggedIn: $loggedIn)
            case 6:
                Accessories(loggedIn: $loggedIn)
            case 7:
                Financials(loggedIn: $loggedIn)
            case 8:
                Sales(loggedIn: $loggedIn)
            case 9:
                MonthlyFigures(loggedIn: $loggedIn)
            case 10:
                BusinessTools(loggedIn: $loggedIn)
            case 11:
                BuyingCaulculator(loggedIn: $loggedIn)
            case 12:
                ProfitCalculator(loggedIn: $loggedIn)
            case 13:
                Account(loggedIn: $loggedIn)
            default:
                Home(loggedIn: $loggedIn)
            }
            
        }
        else{
            Login()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
