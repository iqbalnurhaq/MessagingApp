//
//  ErrorResponse.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 20/12/23.
//

import Foundation

struct ErrorResponse: Decodable, Equatable {
    private enum CodingKeys: String, CodingKey {
        case success = "success"
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
    
    let success: Bool
    let statusCode: String
    let statusMessage: String
}
