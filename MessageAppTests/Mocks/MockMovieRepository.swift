//
//  MockHomeUseCase.swift
//  MessageAppTests
//
//  Created by Iqbal Nur Haq on 27/12/23.
//

import Foundation
@testable import MessageApp

class MockMovieRepository: MovieRepositoryProtocol {
    
    let response: Result<[MovieModel], Error>
    
    init(response: Result<[MovieModel], Error>) {
        self.response = response
    }
    
    func getNowPlayingMovies(result: @escaping (Result<[MessageApp.MovieModel], Error>) -> Void) {
        result(response)
    }
    

}
