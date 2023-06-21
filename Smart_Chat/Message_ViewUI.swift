//
//  Message_ViewUI.swift
//  Smart_Chat
//
//  Created by brianjien on 6/21/23.
//

import SwiftUI

struct ChatHistoryView: View {
    let chatHistory: [ChatMessage]
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 10) {
                ForEach(chatHistory) { message in
                    MessageView(message: message)
                        .transition(.opacity) // Add transition
                        .id(message.id) // Add id for smooth transitions
                        .animation(.easeInOut, value: message.id) // Animate based on message id
                }
            }
            .padding()
        }
    }
}

struct MessageView: View {
    let message: ChatMessage
    @State private var isSendingMessage = false // Add animation state
    
    var body: some View {
        Group {
            if message.isUser {
                HStack {
                    Spacer()
                    Text(message.content)
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(ChatBubble(isFromUser: true))
                }
                .opacity(isSendingMessage ? 0 : 1) // Hide the sent message temporarily during animation
                .animation(.easeInOut, value: isSendingMessage) // Animate opacity
                .onAppear {
                    isSendingMessage = false // Reset the animation state when message appears
                }
            } else {
                HStack {
                    Text(message.content)
                        .padding(10)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .clipShape(ChatBubble(isFromUser: false))
                    Spacer()
                }
            }
        }
    }
}
struct Message_ViewUI: View {
    @State private var message: String = ""
    @State private var chatHistory: [ChatMessage] = [] // Track the chat history
    @State private var isSendingMessage = false // Add animation state
    
    var body: some View {
        VStack {
            Text("Smart Chat")
                .font(.title)
                .padding()
            
            ChatHistoryView(chatHistory: chatHistory)
            
            HStack {
                TextField("Type a message...", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    withAnimation {
                        sendMessage()
                        isSendingMessage = true
                    }
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                        .font(.title)
                }
            }
            .padding()
        }
    }
    
    private func sendMessage() {
        guard !message.isEmpty else { return }
        
        let newMessage = ChatMessage(content: message, isUser: true)
        chatHistory.append(newMessage)
        
        // Clear the text field
        message = ""
        
        // Simulate a response from ChatGPT
        let responseMessage = generateResponse(for: newMessage)
        chatHistory.append(responseMessage)
    }
    
    private func generateResponse(for message: ChatMessage) -> ChatMessage {
        // Implement the logic to generate a response using ChatGPT or any other AI model
        // This is just a placeholder response for demonstration purposes
        let responseContent = "This is a placeholder response from ChatGPT."
        let responseMessage = ChatMessage(content: responseContent, isUser: false)
        sleep(UInt32(0.2))

        return responseMessage
    }
}

struct ChatMessage: Identifiable {
    let id = UUID()
    let content: String
    let isUser: Bool
}

struct ChatBubble: Shape {
    let isFromUser: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let radius: CGFloat = 10
        
        if isFromUser {
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
            path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius), radius: radius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - radius))
            path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        } else {
            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.minY))
            path.addArc(center: CGPoint(x: rect.minX + radius, y: rect.minY + radius), radius: radius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 180), clockwise: true)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - radius))
            path.addArc(center: CGPoint(x: rect.minX + radius, y: rect.maxY - radius), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 90), clockwise: true)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        }
        
        return path
    }
}

struct Message_ViewUI_Previews: PreviewProvider {
    static var previews: some View {
        Message_ViewUI()
    }
}
