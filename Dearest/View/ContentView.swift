//
//  ContentView.swift
//  Dearest
//
//  Created by Julia Kansbod on 2023-01-06.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var authenticationManager = AuthenticationManager()
    @State var splashScreen = true
    
    var body: some View {
        
        ZStack{
            if splashScreen {
                SplashScreen()
            } else{
                
                NavigationView{
                    if authenticationManager.isAuthenticated {
                        HomeView()
                            .environmentObject(authenticationManager)
                    } else {
                        LoginView()
                            .environmentObject(authenticationManager)
                    }
                }
                .alert(isPresented: $authenticationManager.showAlert) {
                    Alert(title: Text("Error"), message: Text(authenticationManager.errorDescription ?? "Error trying to login with credentials, please try again"), dismissButton: .default(Text("Ok")))
                }
                
            }
        }
        .onAppear {
            DispatchQueue
                .main
                .asyncAfter(deadline:
                        .now() + 3) {
                            self.splashScreen = false
                        }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
