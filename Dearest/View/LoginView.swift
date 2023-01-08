//
//  LoginView.swift
//  Dearest
//
//  Created by Julia Kansbod on 2023-01-06.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    var body: some View {
        ZStack {
            
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                Title()
                
                Spacer()
                
                VStack{
                    Image("login-icon")
                        .resizable()
                        .frame(width: 200.0, height: 200.0)
                    
                    VStack {
                        Text("Log in")
                            .font(.title)
                            .tracking(6)
                        Text("To Continue")
                            .tracking(6)
                    }
                    .fontWeight(.bold)
                    .foregroundColor(Color("Dark-Pink"))
                    .textCase(.uppercase)
                    .padding(.vertical)
                }
                
                Spacer()
                
                if authenticationManager.biometryType == .faceID {
                    Button(image: "faceid", text: "Log in with FaceID")
                        .onTapGesture {
                            Task.init {
                                await
                                authenticationManager.authenticateWithBiometrics()
                            }
                        }
                } else if authenticationManager.biometryType == .touchID {
                    Button(image: "touchid", text: "Login with TouchID")
                        .onTapGesture {
                            Task.init {
                                await
                                authenticationManager.authenticateWithBiometrics()
                            }
                        }
                }
                
            }
            .padding(30)
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthenticationManager())
    }
}
