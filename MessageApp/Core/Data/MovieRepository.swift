//
//  MovieRepository.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 09/12/23.
//

import Foundation

final class MovieRepository: NSObject {
    
    typealias MovieInstance = (MovieRemoteDataSourceProtocol) -> MovieRepository
    
    fileprivate let remote: MovieRemoteDataSourceProtocol
    
    private init(remote: MovieRemoteDataSourceProtocol) {
        self.remote = remote
    }
    
    static let sharedInstance: MovieInstance = { remoteRepo in
        return MovieRepository(remote: remoteRepo)
    }
}

extension MovieRepository: MovieRepositoryProtocol {
    
    func getNowPlayingMovies(result: @escaping (Result<[MovieModel], Error>) -> Void) {
        self.remote.getNowPlayingMovies { remoteResponse in
            switch remoteResponse {
            case .success(let movieResponse):
                let moviesModel = MovieMapper.mapMovieResponsesToDomains(input: movieResponse)
                result(.success(moviesModel))
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
}
