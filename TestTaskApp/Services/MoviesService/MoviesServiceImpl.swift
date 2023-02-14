//
//  MoviesServiceImpl.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

class MoviesServiceImpl: MoviesService {
    
    private let timeLifeData: CGFloat = 60 * 5 // 5 min
    
    private let restService: RestMoviesService
    private let coreDataService: CoreDataMoviesService
    private let storage: Storage
    
    private var isActualMovies: Bool {
        guard let lastUpdatedMovies = storage.lastUpdatedMovies else {
            return false
        }
        
        return Date().timeIntervalSince1970 - lastUpdatedMovies.timeIntervalSince1970 < timeLifeData
    }
    
    init(restService: RestMoviesService, coreDataService: CoreDataMoviesService, storage: Storage) {
        self.restService = restService
        self.coreDataService = coreDataService
        self.storage = storage
    }
    
    private func fetchMovies() async throws {
        let moviesResult = await restService.movies.map(\.items)
        let movies = try moviesResult.get()
        await coreDataService.save(movies: movies)
        storage.lastUpdatedMovies = .now
    }
    
    var movies: MoviesResult {
        get async {
            do {
                if !isActualMovies {
                    try await fetchMovies()
                }
                return await coreDataService.movies
            } catch {
                return .failure(.failedFetching(error))
            }
        }
    }

    func getMovies(query: String) async -> MoviesResult {
        do {
            if !isActualMovies {
                try await fetchMovies()
            }
            return await coreDataService.getMovies(query: query)
        } catch {
            return .failure(.failedFetching(error))
        }
    }
}
