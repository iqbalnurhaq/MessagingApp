//
//  CustomError+Ext.swift
//  design_to_code14
//
//  Created by Iqbal Nur Haq on 09/12/23.
//  Copyright © 2023 Dheeraj Kumar Sharma. All rights reserved.
//

import Foundation

enum URLError: LocalizedError {
    case invalidResponse
    case addressUnreachable(URL)
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse: return "The server responded with garbage"
        case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
        }
    }
}
