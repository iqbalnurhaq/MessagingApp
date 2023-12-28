//
//  GetNowPlayingMoviesTest.swift
//  MessageAppTests
//
//  Created by Iqbal Nur Haq on 26/12/23.
//

import XCTest
@testable import MessageApp

final class HomeUseCaseTest: XCTestCase {
    

    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testGetNowPlayingMoviesUseCase_WhenGivenDataFromRepositoryIsSuccessful_ReturnMovieModelList() {
        let repository = MockMovieRepository(response: .success([movieModel]))
        let sut = HomeInteractor(repository: repository)
        
        sut.getNowPlayingMovies { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data, [movieModel])
            case .failure(_):
                XCTFail("Response not valid")
            }
        }
    }
}
