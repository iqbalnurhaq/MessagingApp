//
//  MovieRemoteDataSourceTest.swift
//  MessageAppTests
//
//  Created by Iqbal Nur Haq on 16/12/23.
//

import XCTest
@testable import MessageApp

class MovieRemoteDataSourceTest: XCTestCase {
            
    private var session: URLSession!
    private var url: URL!
    
    override func setUp() {
        url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=2174d146bb9c0eab47529b2e77d6b526")
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLSessionProtocol.self]
        session = URLSession(configuration: configuration)
    }
    
    override func tearDown() {
        session = nil
        url = nil
    }
    
    func testNowPlayingMoviesRemoteDataSource_WhenGivenSuccessfullResponseIs200_ReturnSuccess() async throws {
        
        guard let path = Bundle.main.path(forResource: "NowPlayingMoviesData", ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            XCTFail("Failed to get the static users file.")
            return
        }

        MockURLSessionProtocol.loadingHandler = {
            let response = HTTPURLResponse(url: self.url, statusCode: 200, httpVersion: nil, headerFields: nil)

            return (response!, data)
        }

        let expect = XCTestExpectation(description: "callback")
        
        let staticJSON = try StaticJSONMapper.decode(file: "NowPlayingMoviesData", type: BaseResponse<[MovieResponse]>.self)
        
        MovieRemoteDataSource(urlSession: session).getNowPlayingMovies { result in
            switch result {
            case .success(let dat):
                XCTAssertEqual(dat, staticJSON.results, "The returned response should be decoded properly")
                expect.fulfill()
            case .failure(let error):
                print(error)
            }
        }
        
        wait(for: [expect], timeout: 5)
    }
    
    func testNowPlayingMoviesRemoteDataSource_WhenFunctionExecuteSuccessfully_ReturnSuccess() async throws {
        MockURLSessionProtocol.loadingHandler = {
            let response = HTTPURLResponse(url: self.url, statusCode: 200, httpVersion: nil, headerFields: nil)
            
            return (response!, nil)
        }
        
        let expect = XCTestExpectation(description: "callback")
        
        MovieRemoteDataSource(urlSession: session).getNowPlayingMovies { result in
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 5)
    }
    
    func testNowPlayingMoviesRemoteDataSource_WhenGivenResponseErrorStatusCodeOtherThan200_ReturnURLError() async throws {

        MockURLSessionProtocol.loadingHandler = {
            let response = HTTPURLResponse(
                url: self.url,
                statusCode: 400,
                httpVersion: nil,
                headerFields: nil
            )

            return (response!, nil)
        }

        let expect = XCTestExpectation(description: "callback")


        MovieRemoteDataSource(urlSession: session).getNowPlayingMovies { result in

            switch result {
            case .success(_): break
            case .failure(let error):
                XCTAssertEqual(error.errorDescription!, URLError.addressUnreachable(self.url!).errorDescription)
                expect.fulfill()
            }
        }

        wait(for: [expect], timeout: 5)
    }
    
}
