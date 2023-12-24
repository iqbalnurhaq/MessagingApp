//
//  MovieLocalDataSource.swift
//  MessageAppTests
//
//  Created by Iqbal Nur Haq on 21/12/23.
//

import XCTest
@testable import MessageApp
import CoreData

final class MovieLocalDataSource: XCTestCase {
    
    
   var databaseHelper: DatabaseHelper!
   var coreDataStack: CoreDataTestStack!
    
    override func setUp() {
        coreDataStack = CoreDataTestStack()
        databaseHelper = DatabaseHelper(mainContext: coreDataStack.mainContext, backgroundContext:coreDataStack.backgroundContext )
       
    }
    
    override func tearDown() {
        
    }
    
    func testInsertWatchlistIntoLocalDatabase_WhenGienDataSuccessfully_ReturnCompletionSuccess() {
        // Arrange
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: "WatchlistEntity", into: coreDataStack.backgroundContext) as! WatchlistEntity
        
        newEntity.watchlistId = 1
        newEntity.title = "Killers of the Flower Moon"
        newEntity.overview = "When oil is discovered in 1920s Oklahoma under Osage Nation land, the Osage people are murdered one by one—until the FBI steps in to unravel the mystery."
        newEntity.posterPath = "/dB6Krk806zeqd0YNp2ngQ9zXteH.jpg"
        
        let expect = XCTestExpectation(description: "callback")
        
        // Act
        databaseHelper.insertWatchlist(movie: newEntity) {
            let result = self.databaseHelper.getWatchlist(watchlistId: 1)
            XCTAssertEqual(result?.title, newEntity.title)
            XCTAssertEqual(result?.overview, newEntity.overview)
            XCTAssertEqual(result?.posterPath, newEntity.posterPath)
            expect.fulfill()
        }
        self.wait(for: [expect], timeout: 10)
    }
    
//    func testMovieLocalDataSource_WhenSaveDataToModelSuccessfully_ReturnTrue() async {
//
//        // Arrange
//
//        let expect = XCTestExpectation(description: "callback")
//
//        do {
//            let staticJSON = try StaticJSONMapper.decode(file: "NowPlayingMoviesData", type: BaseResponse<[MovieResponse]>.self)
//
//            let res = MovieMapper.mapMovieResponsesToEntities(input: staticJSON.results, context: coreDataStack.mainContext)
//
//            let sortedRes = res.sorted(by: { $0.id < $1.id })
//
//            print("aaaaa")
////            self.databaseHelper.saveData(objects: sortedRes)
//
//            let fetchRequest = NSFetchRequest<MovieEntity>(entityName: "MovieEntity")
//
//            let t = try self.coreDataStack.mainContext.fetch(fetchRequest)
////            print(t)
//            print("bbbbb")
//        } catch {
//
//        }
//        self.wait(for: [expect], timeout: 10)
//
//    }
}
