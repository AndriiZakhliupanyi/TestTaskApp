//
//  MoviesServiceImpl.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

class MoviesServiceImpl {
    
    private let restService: RestMoviesService
    private let coreDataService: CoreDataMoviesService
    private let storage: Storage
    
    private var isActualMovies: Bool {
        guard let lastUpdatedMovies = storage.lastUpdatedMovies else {
            return false
        }
        let timeLifeData: CGFloat = 0 // 5 min
        
        return Date().timeIntervalSince1970 - lastUpdatedMovies.timeIntervalSince1970 < timeLifeData
    }
    
    init(restService: RestMoviesService, coreDataService: CoreDataMoviesService, storage: Storage) {
        self.restService = restService
        self.coreDataService = coreDataService
        self.storage = storage
    }
    
    var movies: MoviesResult {
        get async {
            if isActualMovies {
                return await coreDataService.movies
            } else {
                let moviesResult = await restService.movies.map(\.items)
                if let movies = try? moviesResult.get() {
                    await coreDataService.save(movies: movies)
                    storage.lastUpdatedMovies = .now
                }
                return moviesResult
            }
        }
    }

    func getMovies(query: String) async -> MoviesResult {
        if !isActualMovies {
            _ = await movies
        }
        return await coreDataService.getMovies(query: query)
    }
}
