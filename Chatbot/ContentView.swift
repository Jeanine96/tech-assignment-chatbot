//
//  ContentView.swift
//  Chatbot
//
//  Created by Jeanine on 05/03/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack{
            Text("Chatbot").font(.title)
            ScrollView{
                
           //Put messages in array
                ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id){
                    message in messageView(message: message)
                }
            }
                
                HStack{
                    TextField("Ask Chatbot", text: $viewModel.userInput)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Button(action: {viewModel.sendMessage()}, label: {
                        Image(systemName:"paperplane")
                            .font(.system(size: 24))
                            .padding()
                    })
//                    Button(action: {}, label: {
//                        Image(systemName:"mic")
//                            .font(.system(size: 24))
//                            .padding()
//                    })
                    
                }
                .padding()
        }
    }
    
//  Ui for the incoming messages from user and assistent
    func messageView(message: Message) -> some View{
        HStack{
            if message.role == .user {Spacer()}
            Text(message.content)
                .padding()
                .background(message.role == .user ?
                            Color.blue.opacity(0.2):
                                Color.gray.opacity(0.2))
                .cornerRadius(8.0)
            if message.role == .assistant{Spacer()}
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
