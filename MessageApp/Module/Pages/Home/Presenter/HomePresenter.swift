//
//  HomePresenter.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 10/12/23.
//

import Foundation

final class HomePresenter: HomePresenterProtocol {
    
    private let homeUseCase: HomeUseCase
    
    var movies = [MovieModel]()
    var numRow: Int = 0
    var loadingState: Bool = false
    var errorMessage: String = ""
    var eventHandler: ((_ event: Event) ->Void)?
    
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
    
    func fetchNowPlayingMovies() {
        self.eventHandler?(.loading)
        self.homeUseCase.getNowPlayingMovies { result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self.movies = movies
                    self.numRow = movies.count
                    self.eventHandler?(.stopLoading)
                    self.eventHandler?(.dataLoaded)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.eventHandler?(.stopLoading)
                    self.eventHandler?(.error(error))
                }
            }
        }
    }
}

enum Event {
    case loading
    case stopLoading
    case dataLoaded
    case error(Error?)
}
