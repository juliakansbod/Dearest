//
//  SplashScreen.swift
//  Dearest
//
//  Created by Julia Kansbod on 2023-01-08.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        
        ZStack{
            Color("Pink")
                .edgesIgnoringSafeArea(.all)
            
            Title()
        }
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
