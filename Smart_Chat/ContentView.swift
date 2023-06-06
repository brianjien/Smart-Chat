//
//  ContentView.swift
//  Smart_Chat
//
//  Created by brianjien on 6/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
     
        
        
                TabView {
            // Home View
            Text("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            // Messages View
            Text("Messages")
                .tabItem {
                    Image(systemName: "message")
                    Text("Messages")
                }
                   
            // Friends View
            Text("Friends")
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Friends")
                }
            
            // Settings View
            Text("Settings")
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
      
        ContentView()
    }
}

