//
//  MoviesServiceImpl.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

class MoviesServiceImpl: MoviesService {
    
    private let restService: RestMoviesService
    private let coreDataService: CoreDataMoviesService
    private let storage: Storage
    
    private var isActualMovies: Bool {
        guard let lastUpdatedMovies = storage.lastUpdatedMovies else {
            return false
        }
        let timeLifeData: CGFloat = 60 * 5 // 5 min
        
        return Date().timeIntervalSince1970 - lastUpdatedMovies.timeIntervalSince1970 < timeLifeData
    }
    
    init(restService: RestMoviesService, coreDataService: CoreDataMoviesService, storage: Storage) {
        self.restService = restService
        self.coreDataService = coreDataService
        self.storage = storage
    }
    
    private func fetchMovies() async {
        let moviesResult = await restService.movies.map(\.items)
        if let movies = try? moviesResult.get() {
            await coreDataService.save(movies: movies)
            storage.lastUpdatedMovies = .now
        }
    }
    
    var movies: MoviesResult {
        get async {
            if !isActualMovies {
                await fetchMovies()
            }
            return await coreDataService.movies
        }
    }

    func getMovies(query: String) async -> MoviesResult {
        if !isActualMovies {
            await fetchMovies()
        }
        return await coreDataService.getMovies(query: query)
    }
}
