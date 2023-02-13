//
//  CoreDataMoviesService.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation
import CoreData

protocol CoreDataMoviesService {
    
    var movies: MoviesResult { get async }
    func getMovies(query: String) async -> MoviesResult
    
    @discardableResult
    func save(movies: [Movie]) async -> Bool
}

final class CoreDataMoviesServiceImpl: CoreDataMoviesService {
    
    private let coreManager: CoreDataManager
    
    init(coreManager: CoreDataManager) {
        self.coreManager = coreManager
    }
    
    var movies: MoviesResult {
        get async {
            let fetchRequest = MovieObject.fetchRequest()
            let sortByRank = NSSortDescriptor(key: "rank", ascending: true)
            fetchRequest.sortDescriptors = [sortByRank]
            fetchRequest.fetchLimit = 10
            do {
                let results = try await coreManager.managedContext.perform { [weak self] in
                    try self?.coreManager.managedContext.fetch(fetchRequest)
                } ?? []
                
                return .success(results.map({ MovieAdapter(object: $0).model }))
            } catch let error {
                debugPrint("Fetch error: \(error) description: \(error.localizedDescription)")
                
                return .failure(.failedFetching(error))
            }
        }
    }
    
    func getMovies(query: String) async -> MoviesResult {
        let fetchRequest = MovieObject.fetchRequest()
        fetchRequest.predicate = NSPredicate(
            format: "title LIKE %@", query
        )
        fetchRequest.fetchLimit = 10
        
        do {
            let results = try await coreManager.managedContext.perform { [weak self] in
                try self?.coreManager.managedContext.fetch(fetchRequest)
            } ?? []
            
            return .success(results.map({ MovieAdapter(object: $0).model }))
        } catch let error {
            debugPrint("Fetch error: \(error) description: \(error.localizedDescription)")
            
            return .failure(.failedFetching(error))
        }
    }
    
    @discardableResult
    func save(movies: [Movie]) async -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieObject")
        fetchRequest.returnsObjectsAsFaults = false
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            _ = try await coreManager.managedContext.perform { [weak self] in
                try self?.coreManager.managedContext.execute(deleteRequest)
            }
        } catch let error {
            debugPrint("Fetch error: \(error) description: \(error.localizedDescription)")
            
            return false
        }
        
        _ = await coreManager.managedContext.perform { [weak self] in
            guard let self = self else { return }
            for model in movies {
                let object = MovieObject(context: self.coreManager.managedContext)
                let adapter = MovieObjectAdapter(model: model, object: object)
                adapter.toMovieObject()
            }
        }
        
        return await coreManager.save()
    }
}
