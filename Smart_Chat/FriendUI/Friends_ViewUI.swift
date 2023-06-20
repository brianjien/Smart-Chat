//
//  Friends_ViewUI.swift
//  Smart_Chat
//
//  Created by brianjien on 6/14/23.
//

import SwiftUI

struct Friend: Identifiable {
    let id = UUID()
    let name: String
    let status: String
    let imageName: String
}

struct Friends_ViewUI: View {
    @State private var isPresentingFriendAddUI = false

    let friends: [Friend] = [
        Friend(name: "John", status: "Online", imageName: "john_profile"),
        Friend(name: "Lisa", status: "Offline", imageName: "lisa_profile"),
        Friend(name: "Mike", status: "Online", imageName: "mike_profile"),
        Friend(name: "Sarah", status: "Online", imageName: "sarah_profile")
    ]
    
    var body: some View {
        NavigationView {
            
            List(friends)
            {
                friend in
                HStack {
                    Image(friend.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                    
                    VStack(alignment: .leading) {
                        Text(friend.name)
                            .font(.headline)
                        Text(friend.status)
                            .font(.subheadline)
                            .foregroundColor(friend.status == "Online" ? .green : .red)
                    }
                }
            }
            .navigationTitle("Friends")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                                        isPresentingFriendAddUI = true
                                    }) {
                                        Circle()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.white)
                                            .overlay(
                                                Image(systemName: "plus")
                                                    .foregroundColor(.black)
                                                    .font(.title)
                                            )
                                    }
                                }
                            }
                        }
                        .sheet(isPresented: $isPresentingFriendAddUI) {
                            FriendAddUI()
                        }
                    }
                }

struct Friends_ViewUI_Previews: PreviewProvider {
    static var previews: some View {
        Friends_ViewUI()
    }
}
