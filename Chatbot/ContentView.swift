//
//  ContentView.swift
//  Chatbot
//
//  Created by Jeanine on 05/03/2024.
//

import SwiftUI

//struct ContentView: View {
//    //  Variables for the list
//    @State var messages = ["Hello, how can I help you?"]
//    @State var newMessage = ""
//
//    var body: some View {
//        NavigationStack() {
//            Text("Chatbot")
//                .font(.title)
//            //List of messages
//            List(messages, id: \.self){
//                message in Text (message)
//            }
//        }
//
//        Spacer()
//        //      Textfield with paperplane and mic button
//        HStack(){
//            TextField("Message Chatbot", text: $newMessage)
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(8)
//                .padding()
//
//            Button(action: {addMessage()}, label: {
//                Image(systemName:"paperplane")
//                    .font(.system(size: 24))
//                    .padding()
//            })
//            Button(action: {}, label: {
//                Image(systemName:"mic")
//                    .font(.system(size: 24))
//                    .padding()
//            })
//        }
//
//    }
//    //  Made function to add messages
//    func addMessage(){
//        messages.append(newMessage)
//        newMessage = ""
//    }
//}

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack{
            ScrollView{
                Text("Chatbot").font(.title)
                //              Put messages in array
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
                    Button(action: {}, label: {
                        Image(systemName:"mic")
                            .font(.system(size: 24))
                            .padding()
                    })
                    
                }
                .padding()
                
            
        }
    }
  
    func messageView(message: Message) -> some View{
        HStack{
            if message.role == .user {Spacer()}
            Text(message.content)
                .padding()
                
            if message.role == .assistant{Spacer()}
        }
       
    }
    
}

#Preview {
    ContentView()
}
