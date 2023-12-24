////
////  NetworkManager.swift
////  MessageApp
////
////  Created by Iqbal Nur Haq on 20/12/23.
////
//
//import Foundation
//
//protocol NetworkingManagerImpl {
//    
//    func request<T: Decodable>(session: URLSession,
//                             _ endpoint: String,
//                             type: T.Type) async throws -> T
////
////    func request(session: URLSession,
////                 _ endpoint: Endpoint) async throws
//}
//
//final class NetworkingManager: NetworkingManagerImpl {
//    
//    static let shared = NetworkingManager()
//    
//    private init() {}
//    
//    func request<T: Decodable>(session: URLSession = .shared, _ endpoint: String, type: T.Type) async throws -> T {
//        
//        guard let url = URL(string: endpoint) else {
//            throw URLError.invalidResponse
//        }
//        
//        let task = session.dataTask(with: url) { maybeData, maybeResponse, maybeError in
//            if maybeError != nil {
//                throw URLError.invalidResponse
//            } else if let data = maybeData, let response = maybeResponse as? HTTPURLResponse {
//                if 200 ... 299 ~= response.statusCode {
//                    let decode = JSONDecoder()
//                    do {
//                        let movies = try decode.decode(T.self, from: data)
//                        return movies
//                    }catch(_) {
//                        throw URLError.invalidResponse
//                    }
//                } else if response.statusCode == 401 {
//                    throw URLError.invalidResponse
//                } else {
//                    throw URLError.invalidResponse
//                }
//            }
//        }
//        
//        task.resume()
//    }
//}
