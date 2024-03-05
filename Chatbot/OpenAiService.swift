//
//  OpenAiService.swift
//  Chatbot
//
//  Created by Jeanine on 05/03/2024.
//

import Foundation
import Alamofire

class OpenAiService{
//    Url local server Jan ai
    private let localServerURL = "http://127.0.0.1:1337/v1/chat/completions"
    
    func sendMessage(messages: [Message]) async -> ChatResponse?{
        let AiMessages = messages.map({ChatMessage(role: $0.role, content: $0.content)})
        let body = ChatBody(model: "mistral-ins-7b-q4", messages: AiMessages, temperature: 0.7)
        let headers: HTTPHeaders = []
        return try? await AF.request(
            localServerURL,
            method: .post,
            parameters: body,
            encoder: .json,
            headers: headers).serializingDecodable(ChatResponse.self).value
        
    }
}

//variables for request
struct ChatBody: Encodable {
    let model: String
    let messages:[ChatMessage]
    let temperature: Float?
}

struct ChatMessage: Codable {
    let role: SenderRole
    let content: String
}

enum SenderRole: String, Codable{
    case me
    case assistant
    case system
}
//variables for response
struct ChatResponse: Decodable{
    let choices: [ChatChoice]
}

struct ChatChoice: Decodable {
    let message: [ChatMessage]
}
