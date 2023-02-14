//
//  MoviesServiceImplTests.swift
//  TestTaskAppTests
//
//  Created by Andrii Zakhliupanyi on 14.02.2023.
//

@testable import TestTaskApp
import XCTest

final class MoviesServiceImplTests: XCTestCase {

    func testMoviesCallCount() async {
        // Given
        let storage = StorageImpl()
        storage.lastUpdatedMovies = nil
        let restMoviesServiceSpy = RestMoviesServiceSpy()
        let coreDataMoviesServiceSpy = CoreDataMoviesServiceSpy()
        let sut = MoviesServiceImpl(
            restService: restMoviesServiceSpy,
            coreDataService: coreDataMoviesServiceSpy,
            storage: storage
        )
        
        // When
        _ = await sut.movies
        _ = await sut.movies
        _ = await sut.movies
        
        // Then
        XCTAssertEqual(restMoviesServiceSpy.moviesCountCalled, 1)
        XCTAssertEqual(coreDataMoviesServiceSpy.moviesCountCalled, 3)
    }
    
    func testStorageLastUpdatedMovies() async {
        // Given
        let sut = StorageImpl()
        sut.lastUpdatedMovies = nil
        let moviesService = MoviesServiceImpl(
            restService: RestMoviesServicePreview(),
            coreDataService: CoreDataMoviesServicePreview(),
            storage: sut
        )
        
        // When
        _ = await moviesService.movies
        
        // Then
        XCTAssertNotNil(sut.lastUpdatedMovies)
    }
}
