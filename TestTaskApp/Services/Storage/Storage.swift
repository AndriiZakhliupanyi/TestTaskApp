//
//  Storage.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

protocol Storage: AnyObject {
    
    var lastUpdatedMovies: Date? { get set }
}

final class StorageImpl: Storage {
    
    private enum Key: String {
        
        case lastUpdatedMovies
    }
    
    private let storage: Storable
    
    var lastUpdatedMovies: Date? {
        get {
            storage.get(for: Key.lastUpdatedMovies.rawValue)
        }
        set {
            storage.set(value: newValue, for: Key.lastUpdatedMovies.rawValue)
        }
    }
    
    init() {
        storage = UserDefaultsStorage()
    }
}
