//
//  MockMovieRemoteDataSource.swift
//  MessageAppTests
//
//  Created by Iqbal Nur Haq on 25/12/23.
//

import XCTest
@testable import MessageApp

final class MockMovieRemoteDataSource: MovieRemoteDataSourceProtocol {
    
    let response: Result<[MovieResponse], MessageApp.URLError>
    
    init(response: Result<[MovieResponse], MessageApp.URLError>) {
        self.response = response
    }
    
    func getNowPlayingMovies(result: @escaping (Result<[MessageApp.MovieResponse], MessageApp.URLError>) -> Void) {
        switch response {
        case .success(let data):
            result(.success(data))
        case .failure(let error):
            result(.failure(error))
        }
    }
}
