//
//  NowPlayingRemoteDataSource.swift
//  design_to_code14
//
//  Created by Iqbal Nur Haq on 09/12/23.
//  Copyright © 2023 Dheeraj Kumar Sharma. All rights reserved.
//

import Foundation

protocol MovieRemoteDataSourceProtocol: AnyObject {
    func getNowPlayingMovies(result: @escaping(Result<[MovieResponse], URLError>) -> Void)
}

final class MovieRemoteDataSource: NSObject {
    
    typealias MovieRemoteInstance = (URLSession) -> MovieRemoteDataSource
    
    let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    static let sharedInstance: MovieRemoteInstance = { urlSession in
        return MovieRemoteDataSource(urlSession: urlSession)
    }
}

extension MovieRemoteDataSource: MovieRemoteDataSourceProtocol {
    func getNowPlayingMovies(result: @escaping (Result<[MovieResponse], URLError>) -> Void) {
        guard let url = URL(string: Endpoints.Gets.now_playing.url) else { return }
        
        let task = urlSession.dataTask(with: url) { maybeData, maybeResponse, maybeError in
            if maybeError != nil {
                result(.failure(.addressUnreachable(url)))
            } else if let data = maybeData, let response = maybeResponse as? HTTPURLResponse {
                if 200 ... 299 ~= response.statusCode {
                    let decode = JSONDecoder()
                    do {
                        let movies = try decode.decode(BaseResponse<[MovieResponse]>.self, from: data).results
                        result(.success(movies))
                    }catch(_) {
                        result(.failure(.invalidResponse))
                    }
                } else if response.statusCode == 401 {
                    result(.failure(.invalidCredential))
                } else {
                    result(.failure(.addressUnreachable(url)))
                }
            }
        }
        
        task.resume()
    }
    
    
}
