//
//  MoviesService.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

protocol MoviesService {
    
    var movies: MoviesResult { get async }
    func getMovies(query: String) async -> MoviesResult
}
