//
//  ListViewViewModelTests.swift
//  TestTaskAppTests
//
//  Created by Andrii Zakhliupanyi on 14.02.2023.
//

@testable import TestTaskApp
import XCTest
import UIKit

final class ListViewViewModelTests: XCTestCase {
    
    var listViewModel: ListView.ListViewModel!
    var moviesService: MoviesServiceStub!
    
    override func setUp() {
        super.setUp()
        
        moviesService = MoviesServiceStub()

        let diContainer = DIContainer(
            navigationService: NavigationService(),
            moviesService: moviesService,
            storage: StoragePreview()
        )
        listViewModel = .init(
            router: ListView.ListRouterImpl(diContainer: diContainer),
            diContainer: diContainer
        )
    }
    
    func testStateMovies() async {
        // Given
        moviesService.moviesHandler = {
            return .success([.placeholder])
        }
        
        // When
        await listViewModel.fetchMovies()
        
        // Then
        let isMoviesState: Bool
        if case .movies = listViewModel.state {
            isMoviesState = true
        } else {
            isMoviesState = false
        }
        XCTAssertTrue(isMoviesState)
    }
    
    func testStateError() async {
        // Given
        moviesService.moviesHandler = {
            return .failure(.undefined)
        }
        
        // When
        await listViewModel.fetchMovies()
        
        // Then
        let isErrorState: Bool
        if case .error = listViewModel.state {
            isErrorState = true
        } else {
            isErrorState = false
        }
        XCTAssertTrue(isErrorState)
    }
    
    func testStateLoading() async {
        // Given
        let loadingExpectation = expectation(description: "Loading test")
        
        // When
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            loadingExpectation.fulfill()
        }
        
        // Then
        wait(for: [loadingExpectation], timeout: 0.3)
        let isErrorState: Bool
        if case .loading = listViewModel.state {
            isErrorState = true
        } else {
            isErrorState = false
        }
        XCTAssertTrue(isErrorState)
    }
}
