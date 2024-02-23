//
//  ContentView.swift
//  Chatbot
//
//  Created by Jeanine on 23/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var textFieldtext: String = ""
    
    var body: some View {
       VStack() {
          Text("Chat Ai - Chatbot")
               .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
               .bold()
           
           Divider()
           
           Text("How can I help you?")
           
           HStack(){
               TextField(
                "Message Chatbot", text: $textFieldtext
               )
               .border(Color.gray)
               .padding()
               .textFieldStyle(.roundedBorder)
               
               Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                   Image(systemName: "mic")
               })
               .padding()
               }
           }
            
               
                
        }
    }


#Preview {
    ContentView()
}
