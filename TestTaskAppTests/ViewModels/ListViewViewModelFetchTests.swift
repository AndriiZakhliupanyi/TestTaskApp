//
//  ListViewViewModelFetchTests.swift
//  TestTaskAppTests
//
//  Created by Andrii Zakhliupanyi on 14.02.2023.
//

@testable import TestTaskApp
import XCTest

final class ListViewViewModelFetchTests: XCTestCase {
    
    var listViewModel: ListView.ListViewModel!
    var moviesService: MoviesServiceSpy!
    var storage: StorageImpl!
    
    override func setUp() {
        super.setUp()
        
        moviesService = MoviesServiceSpy()
        storage = StorageImpl()
        storage.lastUpdatedMovies = nil
        
        let diContainer = DIContainer(
            navigationService: NavigationService(),
            moviesService: moviesService,
            storage: storage
        )
        listViewModel = .init(
            router: ListView.ListRouterImpl(diContainer: diContainer),
            diContainer: diContainer
        )
    }
    
    func testFetchAllMovies() async {
        // Given
        listViewModel.searchText = ""
        
        // When
        await listViewModel.fetchMovies()
        
        // Then
        XCTAssertEqual(moviesService.moviesCountCalled, 1)
        XCTAssertEqual(moviesService.getMoviesCountCalled, 0)
    }
    
    func testFetchSearchMovies() async {
        // Given
        listViewModel.searchText = "test"
        
        // When
        await listViewModel.fetchMovies()
        
        // Then
        XCTAssertEqual(moviesService.moviesCountCalled, 0)
        XCTAssertEqual(moviesService.getMoviesCountCalled, 1)
    }
}
