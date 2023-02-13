//
//  CoreDataMoviesServiceStub.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

final class CoreDataMoviesServiceStub: CoreDataMoviesService {
    
    var movies: MoviesResult {
        get async {
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
    
    func getMovies(query: String) async -> MoviesResult {
        return .success(
            [
                .placeholder(id: 1),
                .placeholder(id: 2),
                .placeholder(id: 3)
            ]
        )
    }
    
    @discardableResult
    func save(movies: [Movie]) async -> Bool {
        return true
    }
}
