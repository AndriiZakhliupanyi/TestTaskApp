//
//  StorageStub.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

final class StoragePreview: Storage {
    
    var lastUpdatedMovies: Date? {
        get {
            return Date().addingTimeInterval(-60 * 10)
        }
        set {}
    }
}
