//
//  MoviesServiceStub.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

final class MoviesServiceStub: MoviesService {
    
    var movies: MoviesResult {
        get async {
            return .success(
                [
                    .placeholder(id: 1),
                    .placeholder(id: 2),
                    .placeholder(id: 3),
                    .placeholder(id: 4),
                    .placeholder(id: 5),
                    .placeholder(id: 6),
                    .placeholder(id: 7)
                ]
            )
        }
    }

    func getMovies(query: String) async -> MoviesResult {
        return .success(
            [
                .placeholder(id: 1),
                .placeholder(id: 2),
                .placeholder(id: 3),
                .placeholder(id: 4),
                .placeholder(id: 5),
                .placeholder(id: 6)
            ]
        )
    }
}
