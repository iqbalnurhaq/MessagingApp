//
//  HomeInteractor.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 09/12/23.
//

import Foundation

protocol HomeUseCase {
    func getNowPlayingMovies(completion: @escaping (Result<[MovieModel], Error>) -> Void)
}

class HomeInteractor: HomeUseCase {
    
    private let repository: MovieRepositoryProtocol
    
    required init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    
    func getNowPlayingMovies(completion: @escaping (Result<[MovieModel], Error>) -> Void) {
        self.repository.getNowPlayingMovies { result in
            completion(result)
        }
    }
}
