//
//  HomePresenterTest.swift
//  MessageAppTests
//
//  Created by Iqbal Nur Haq on 27/12/23.
//

import XCTest
@testable import MessageApp

final class HomePresenterTest: XCTestCase {
    
    
    var remote: MovieRemoteDataSourceProtocol!
    var remoteError: MovieRemoteDataSourceProtocol!
    var repository: MovieRepository!
    var useCase: HomeUseCase!
    
    override func setUp() {
        remote = MockMovieRemoteDataSource(response: .success([movieResponse]))
        remoteError = MockMovieRemoteDataSource(response: .failure(.invalidCredential))
        repository = MovieRepository.sharedInstance(remote)
        useCase = HomeInteractor(repository: repository)
    }
    
    override func tearDown() {
        
    }
    
    func testGetNowPlayingMovieFromUseCase_WhenGetDataSucessfully_ReturnMovieModel() {
        let sut = makeSUT(homeUseCase: useCase)

        let expect = XCTestExpectation(description: "Callback")
        
        sut.fetchNowPlayingMovies()

        sut.eventHandler = { event in
            switch event {
                
            case .loading:
                XCTAssertEqual(sut.loadingState, true)
            case .stopLoading:
                XCTAssertEqual(sut.loadingState, false)
            case .dataLoaded:
                XCTAssertEqual(sut.movies, [movieModel])
                XCTAssertEqual(sut.errorMessage, "")
                XCTAssertEqual(sut.loadingState, false)
                XCTAssertEqual(sut.numRow, 1)
                expect.fulfill()
                
            case .error(_):
                XCTFail("Cannot get data from use case")
            }
        }

        self.wait(for: [expect], timeout: 5)
    }
    
    func testGetNowPlayingMovieFromUseCase_WhenGetDataInvalidCredential_ReturnErrorData() {
        let repository = MovieRepository.sharedInstance(remoteError)
        let useCase = HomeInteractor(repository: repository)
        let sut = makeSUT(homeUseCase: useCase)

        let expect = XCTestExpectation(description: "Callback")
        
        sut.fetchNowPlayingMovies()

        sut.eventHandler = { event in
            switch event {
                
            case .loading:
                XCTAssertEqual(sut.loadingState, true)
            case .stopLoading:
                XCTAssertEqual(sut.loadingState, false)
            case .dataLoaded:
                XCTFail("This reponse not allowed")
            case .error(_):
                XCTAssertEqual(sut.movies, [])
                XCTAssertEqual(sut.errorMessage, "Invalid Credential")
                XCTAssertEqual(sut.loadingState, false)
                XCTAssertEqual(sut.numRow, 0)
                expect.fulfill()
            }
        }

        self.wait(for: [expect], timeout: 5)
    }
    
    private func makeSUT(
        homeUseCase: HomeUseCase
    ) -> HomePresenter {
        let sut = HomePresenter(homeUseCase: homeUseCase)
        return sut
    }

}
