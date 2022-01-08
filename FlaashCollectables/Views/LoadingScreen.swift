//
//  LoadingScreen.swift
//  FlaashCollectables
//
//  Created by George Killeen on 08/01/2022.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        
        ZStack{
            
            Color.white.opacity(0.18)
            
            ProgressView()
                .frame(width: 70, height: 70)
                .background(Color.white)
                .cornerRadius(10)
            
        }
        .ignoresSafeArea()
        .colorScheme(.light)
        
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
