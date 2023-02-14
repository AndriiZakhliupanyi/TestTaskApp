//
//  MoviesServiceStub.swift
//  TestTaskAppTests
//
//  Created by Andrii Zakhliupanyi on 14.02.2023.
//

@testable import TestTaskApp
import Foundation

final class MoviesServiceStub: MoviesService {
    
    var moviesHandler: (() -> (MoviesResult))?
    var movies: MoviesResult {
        get async {
            return moviesHandler?() ?? .failure(.undefined)
        }
    }
    
    var getMoviesHandler: (() -> (MoviesResult))?
    func getMovies(query: String) async -> MoviesResult {
        return getMoviesHandler?() ?? .failure(.undefined)
    }
}
