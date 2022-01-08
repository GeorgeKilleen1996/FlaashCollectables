//
//  ContentView.swift
//  FlaashCollectables
//
//  Created by George Killeen on 08/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("log_Status") var status = false
    
    var body: some View {
        
        if(status){
            Home()
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
