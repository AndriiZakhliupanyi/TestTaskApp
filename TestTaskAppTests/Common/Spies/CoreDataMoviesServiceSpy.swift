//
//  CoreDataMoviesServiceSpy.swift
//  TestTaskAppTests
//
//  Created by Andrii Zakhliupanyi on 14.02.2023.
//

@testable import TestTaskApp
import Foundation

final class CoreDataMoviesServiceSpy: CoreDataMoviesService {
    
    var moviesCountCalled: Int = 0
    var movies: MoviesResult {
        get async {
            moviesCountCalled += 1
            return .success(
                [
                    .placeholder(id: 1),
                    .placeholder(id: 2),
                    .placeholder(id: 3),
                    .placeholder(id: 4)
                ]
            )
        }
    }
    
    var getMoviesCountCalled: Int = 0
    func getMovies(query: String) async -> MoviesResult {
        getMoviesCountCalled += 1
        return .success(
            [
                .placeholder(id: 1),
                .placeholder(id: 2),
                .placeholder(id: 3)
            ]
        )
    }
    
    var saveMoviesCountCalled: Int = 0
    @discardableResult
    func save(movies: [Movie]) async -> Bool {
        saveMoviesCountCalled += 1
        return true
    }
}
