//
//  AccountSettingsView.swift
//  Smart_Chat
//
//  Created by brianjien on 6/14/23.
//

import SwiftUI

struct AccountSettingsView: View {
    @State private var profileImage: Image?
    @State private var showImagePicker: Bool = false
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var Save_Change: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                showImagePicker.toggle()
            }) {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                }
            }
            
            Text("Change Photo")
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.blue)
                .padding(.top, 8)
                .onTapGesture {
                    showImagePicker.toggle()
                }
            
            Form {
                Section(header: Text("Account Information")) {
                    TextField("Username", text: $username)
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                }
                
                Section {
                    Button(action: {
                        saveChanges()
                      
                        
                    }){
                        Text("Save Changes")
                    }
                }
            }
            .navigationTitle("Account Settings")
        }
        .sheet(isPresented: $showImagePicker) {
            // Present the image picker here and handle the selected image
            ImagePickerView(selectedImage: $profileImage)
        }
    }
    
    private func saveChanges() {
    Save_Change = true
        print("scucess")
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}
