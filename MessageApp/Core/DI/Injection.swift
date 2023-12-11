//
//  Injection.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 09/12/23.
//

import Foundation

final class Injection: NSObject {
    private func provideRepository() -> MovieRepositoryProtocol {
        let remote: MovieRemoteDataSource = MovieRemoteDataSource.sharedInstance
        return MovieRepository.sharedInstance(remote)
    }
    
    func provideHome() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
    
    func provideHomePresenter() -> HomePresenterProtocol {
        let viewModel = HomePresenter(homeUseCase: provideHome())
        return viewModel
    }
}
