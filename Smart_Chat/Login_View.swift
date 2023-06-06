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
    
    var body: some View {
   
        VStack {
            TextField("User name/Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .cornerRadius(10)
                .bold()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .cornerRadius(10)
                .bold()
            Button(action: {
                // Perform login action here
                login()
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                 
            }
            .padding()
            Text("Don't have a account? Click here!")
        }
        .padding()
    }
    
    func login() {
        // Implement your login logic here
        if email.isEmpty || password.isEmpty {
            // Show an error message if the email or password is empty
            print("Please enter your email and password")
        } else {
            // Perform the login operation
            print("Logging in...")
        }
    }
}

struct LoginView_Previews: PreviewProvider {

    static var previews: some View {
        LoginView()
    }
}
