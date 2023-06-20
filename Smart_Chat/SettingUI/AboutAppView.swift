//
//  AboutAppView.swift
//  Smart_Chat
//
//  Created by brianjien on 6/14/23.
//
import SwiftUI

struct AboutAppView: View {
    var body: some View {
        VStack {
            Text("Welcome to Smart Chat!")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("About this App")
                .font(.headline)
                .padding(.top, 20)
            
            Text("Smart Chat is an innovative messaging app that leverages artificial intelligence to provide an intelligent and personalized chat experience. It utilizes state-of-the-art natural language processing models to understand and respond to your messages in a conversational manner.")
                .font(.body)
                .padding()
            
            Text("Features")
                .font(.headline)
                .padding(.top, 20)
            
            Text("• Real-time messaging with friends and family")
                .font(.body)
                .padding(.bottom, 5)
            
            Text("• AI-powered chatbot for intelligent conversations")
                .font(.body)
                .padding(.bottom, 5)
            
            Text("• Rich media support: send photos, videos, and more")
                .font(.body)
                .padding(.bottom, 5)
            
            Text("• Secure and private communication")
                .font(.body)
                .padding(.bottom, 5)
        }
        .padding()
    }
}

struct AboutAppView_Previews: PreviewProvider {
    static var previews: some View {
        AboutAppView()
    }
}
