//
//  Smart_ChatApp.swift
//  Smart_Chat
//
//  Created by brianjien on 6/5/23.
//

import SwiftUI

@main
struct Smart_ChatApp: App {
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate
    @State private var navigateToRegistration: Bool = false
    @State private var loggedIn: Bool = false
    @State private var navigateToLogin: Bool = false


    var body: some Scene {
        WindowGroup {
            if loggedIn {
                  ContentView()
              } else if navigateToRegistration {
                  RegistrationView(navigateToLogin: $navigateToLogin)
              } else if navigateToLogin {
                  LoginView(Change_To_Main: $loggedIn, navigateToRegistration: $navigateToRegistration, navigateToLogin: $navigateToLogin)
              } else {
                  LoginView(Change_To_Main: $loggedIn, navigateToRegistration: $navigateToRegistration, navigateToLogin: $navigateToLogin)
              }
        }

    }
}
