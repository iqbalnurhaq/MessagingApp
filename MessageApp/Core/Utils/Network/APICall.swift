//
//  APICall.swift
//  design_to_code14
//
//  Created by Iqbal Nur Haq on 09/12/23.
//  Copyright © 2023 Dheeraj Kumar Sharma. All rights reserved.
//

import Foundation


struct API {
    static let baseUrl = "https://api.themoviedb.org/3/movie/"
    static let apiKey = "2174d146bb9c0eab47529b2e77d6b526"
}

protocol Endpoint {
    var url: String { get }
}

enum Endpoints {
    enum Gets: Endpoint {
        case now_playing
        
        public var url: String {
            switch self {
            case .now_playing: return "\(API.baseUrl)now_playing?api_key=\(API.apiKey)"
            }
        }
    }
}


