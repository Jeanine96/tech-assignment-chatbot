//
//  OpenAiService.swift
//  Chatbot
//
//  Created by Jeanine on 05/03/2024.
//

import Foundation
import Alamofire

class OpenAiService {
    private let localServerURL = "http://127.0.0.1:1337/v1/chat/completions"
    
    func sendMessage(messages: [Message]) async -> OpenAIChatResponse? {
        let openAiMessages = messages.map({OpenAIChatMessage(role: $0.role, content: $0.content)})
        // Change the model gpt-3.5.-turbo or gpt-4
        let body = OpenAIChatBody(model: "mistral-ins-7b-q4", messages: openAiMessages, temperature: 0.7)
        let headers: HTTPHeaders = [
//
        ]
        return try? await AF.request(localServerURL, method: .post, parameters: body, encoder: .json, headers: headers).serializingDecodable(OpenAIChatResponse.self).value
    }
}

struct OpenAIChatBody: Encodable {
    let model: String
    let messages: [OpenAIChatMessage]
    let temperature: Float?
}

struct OpenAIChatMessage: Codable {
    let role: SenderRole
    let content: String
}

enum SenderRole: String, Codable {
    case system
    case user
    case assistant
}
//variables for response
struct OpenAIChatResponse: Decodable {
    let choices: [OpenAIChoice]
}

struct OpenAIChoice: Decodable {
    let message: OpenAIChatMessage
}

