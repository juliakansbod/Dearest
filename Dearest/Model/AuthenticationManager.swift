//
//  AuthenticationManager.swift
//  Dearest
//
//  Created by Julia Kansbod on 2023-01-06.
//

import Foundation
import LocalAuthentication

class AuthenticationManager: ObservableObject {
    
    private(set) var context = LAContext()
    @Published private(set) var biometryType: LABiometryType = .none
    private(set) var canEvaluatePolicy = false
    @Published private(set) var isAuthenticated = false
    @Published private(set) var errorDescription: String?
    @Published var showAlert = false
    
    init() {
        getBiometryType()
    }
    
    func getBiometryType() {
        canEvaluatePolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometryType = context.biometryType
    }
    
    func authenticateWithBiometrics() async {
        context = LAContext() //need to set the context every time a user logs onto the app, otherwise the user will see the contents immediately.
        
        context.localizedFallbackTitle = ""; //removes the "enter password" fallback option.
        
        if canEvaluatePolicy {
            
            let reason = "To log into your account."
            
            do {
                
                let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
                
                if success {
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                        print("is Authenticated", self.isAuthenticated)
                    }
                }
                
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.errorDescription = error.localizedDescription
                    self.showAlert = true
                }
            }
        }
    }
    
    func logout() {
        isAuthenticated = false
    }
    
}

