//
//  Login_View.swift
//  Smart_Chat
//
//  Created by brianjien on 6/6/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @Binding var Change_To_Main: Bool
    @State private var isLoading: Bool = false
    @Binding var navigateToRegistration: Bool
    @Binding var navigateToLogin: Bool
    @State private var showAccountText: Bool = true

    var body: some View {
        VStack {
            Text("Smart talk")
                .font(.system(size: 45, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(15)
            
            Image("Logo")
            
            TextField("User name/Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .cornerRadius(10)
                .font(.system(size: 14, weight: .bold))
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .cornerRadius(10)
                .font(.system(size: 14, weight: .bold)) // Make text bold
            
            Button(action: {
                // Perform login action here
                login()
            }) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .foregroundColor(.white)
                } else {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .onChange(of: navigateToLogin) { value in
                if value {
                    navigateToLogin = false // Reset the flag to false
                }
            }
            
            if showAccountText {
                HStack {
                    Spacer()
                    Text("Don't have an account?")
                    Text("Click here!")
                        .underline()
                        .foregroundColor(.blue)
                        .onTapGesture {
                            navigateToLogin = false
                            navigateToRegistration = true
                        }
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange.opacity(0.3))
    }
    
    func login() {
        if email.isEmpty || password.isEmpty {
            // Show an error message if the email or password is empty
            print("Please enter your email and password")
        } else {
            isLoading = true
            showAccountText = false 
            // Simulate an asynchronous login operation
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // Perform the login operation
                print("Logging in...")
                
                // Set the changeToMain variable to true to switch to the main view
                Change_To_Main = true
                // Hide the account text
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(Change_To_Main: .constant(false), navigateToRegistration: .constant(false), navigateToLogin: .constant(false))
            .padding(0.0)
    }
}
