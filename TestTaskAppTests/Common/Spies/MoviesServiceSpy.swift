//
//  MoviesServiceSpy.swift
//  TestTaskAppTests
//
//  Created by Andrii Zakhliupanyi on 14.02.2023.
//

@testable import TestTaskApp
import Foundation

final class MoviesServiceSpy: MoviesService {
    
    var moviesCountCalled: Int = 0
    var movies: MoviesResult {
        get async {
            moviesCountCalled += 1
            return .success([])
        }
    }
    
    var getMoviesCountCalled: Int = 0
    func getMovies(query: String) async -> MoviesResult {
        getMoviesCountCalled += 1
        return .success([])
    }
}
