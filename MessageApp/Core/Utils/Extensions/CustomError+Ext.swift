//
//  CustomError+Ext.swift
//  design_to_code14
//
//  Created by Iqbal Nur Haq on 09/12/23.
//  Copyright © 2023 Dheeraj Kumar Sharma. All rights reserved.
//

import Foundation

enum URLError: Error, Hashable, Equatable, LocalizedError  {
    case invalidResponse
    case addressUnreachable(URL)
    case custom(String)
    case invalidCredential
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse: return "The server responded with garbage"
        case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
        case .custom(let message): return "\(message)"
        case .invalidCredential: return "Invalid Credential"
        }
    }
}
