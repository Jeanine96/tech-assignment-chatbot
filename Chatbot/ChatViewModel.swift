//
//  ChatViewModel.swift
//  Chatbot
//
//  Created by Jeanine on 05/03/2024.
//

import Foundation

extension ContentView {
    class Viewmodel: ObservableObject{
        //      Variables can be used in other views with published
        @Published var messages: [Message] = []
        @Published var userInput = ""
        
        private let openAiService = OpenAiService()
        
        func sendMessage(){
            //            Create a newMessage
            let newMessage = Message(id: UUID(), role: .me, content: userInput, created: Date())
            //            Adds new element to array
            messages.append(newMessage)
            userInput = ""
            
            
            Task {
                let response = await openAiService.sendMessage(messages:messages)
                guard let receivedAiMessage = response?.choices.first?.message
                else {
                    print ("Didn't receive message")
                    return
                }
                let receivedMessage = Message(id: UUID(), role: receivedAiMessage.role, content: receivedAiMessage.content, created: Date())
                await MainActor.run {
                    messages.append(receivedMessage)
                }
            }
        }
    }
}

struct Message: Decodable{
    let id: UUID
    let role: SenderRole
    let content: String
    let created: Date
}
