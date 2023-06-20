//
//  FriendAddUI.swift
//  Smart_Chat
//
//  Created by brianjien on 6/19/23.
//

import SwiftUI

struct FriendAddUI: View {
    @State var friendID: String = ""
    @State var showSearchResult = false // Track the state of search result
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            Text("Type in your friend's name here")
                .font(.title)
                .padding()
            
            TextField("Input your friend's ID here", text: $friendID)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.none)
                .bold()
                .opacity(100)
            
            // Show search result form when the search button is pressed
            if showSearchResult {
                SearchResultForm()
            } else {
                Button(action: {
                    submit()
                }) {
                    Text("Find")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            
            Spacer()
        }
    }
    
    func submit() {

        showSearchResult = true
    }
}

struct SearchResultForm: View {
    var body: some View {
        VStack {
            // Add your search result form content here
            Text("Search Results")
                .font(.title)
                .padding()
            
            // Additional views for displaying search results
            
            // Example: Displaying friend's name and other details
    
          
    
            
            Spacer()
        }
    }
}


struct FriendAddUI_Previews: PreviewProvider {
    static var previews: some View {
        FriendAddUI()
    }
}
