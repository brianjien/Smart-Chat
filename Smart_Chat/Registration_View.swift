//
//  Registration_View.swift
//  Smart_Chat
//
//  Created by brianjien on 6/7/23.
//

//  Registration_View.swift
//  Smart_Chat
//
//  Created by brianjien on 6/7/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isLoading: Bool = false
    @Binding var navigateToLogin: Bool 
    @Binding var navigateToRegistration: Bool

    
    var body: some View {
        
        VStack {
            
            
            Text("Create an Account")
                .font(.system(size: 45, weight: .bold)) // Make text bold
            Image("Registratioin")
                .resizable()
                .aspectRatio(contentMode:  .fit)
                .frame(width: 150)
            
            TextField("Username", text: $username)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .padding()
                         .autocapitalization(.none)
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            
            
            Button(action: {
                // Perform registration action here
                register()
            }) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .foregroundColor(.white)
                } else {
                    Text("Register")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                }
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange.opacity(0.3))
        
    }
    
    
    func register() {
        navigateToRegistration = false
        if username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty  {
            // Show an error message if any field is empty
            print("Please fill in all fields")
        } else if password != confirmPassword {
            // Show an error message if passwords don't match
            print("Passwords do not match")
            
            
        } else {
            isLoading = true
            navigateToRegistration = false
            // Simulate an asynchronous registration operation
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // Perform the registration operation
                print("Registered successfully")
                
                // Reset the form
                username = ""
                email = ""
                password = ""
                confirmPassword = ""
                navigateToLogin = true
                
            }
        }
    }
    
    
    
    
    
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(navigateToLogin: .constant(false), navigateToRegistration: .constant(false))
            .padding(0.0)
        
        
        
        
        
    }
}
