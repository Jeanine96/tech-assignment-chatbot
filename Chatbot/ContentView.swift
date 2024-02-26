//
//  ContentView.swift
//  Chatbot
//
//  Created by Jeanine on 23/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack() {
            Text("How can I help you?")
                
                .navigationTitle("Chat Ai - Chatbot")
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "mic")
                    .font(.system(size: 70))
            })
        }
    }
}

#Preview {
    ContentView()
}
