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
    
    private override init() {}
    
    static let sharedInstance: MovieRemoteDataSource = MovieRemoteDataSource()
}

extension MovieRemoteDataSource: MovieRemoteDataSourceProtocol {
    func getNowPlayingMovies(result: @escaping (Result<[MovieResponse], URLError>) -> Void) {
        guard let url = URL(string: Endpoints.Gets.now_playing.url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { maybeData, maybeResponse, maybeError in
            if maybeError != nil {
                result(.failure(.addressUnreachable(url)))
            } else if let data = maybeData, let response = maybeResponse as? HTTPURLResponse, response.statusCode == 200 {
                let decode = JSONDecoder()
                do {
                    let movies = try decode.decode(BaseResponse<[MovieResponse]>.self, from: data).results
                    result(.success(movies))
                }catch(let error) {
                    result(.failure(.invalidResponse))
                }
            }
        }
        
        task.resume()
    }
    
    
}
