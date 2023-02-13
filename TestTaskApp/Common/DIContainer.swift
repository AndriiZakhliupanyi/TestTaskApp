//
//  DIContainer.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

/// Dependencies injection container.
final class DIContainer {
    
    let navigationService: NavigationService
    let moviesService: MoviesService
    let storage: Storage
    
    init(
        navigationService: NavigationService,
        moviesService: MoviesService,
        storage: Storage
    ) {
        self.navigationService = navigationService
        self.moviesService = moviesService
        self.storage = storage
    }
}

extension DIContainer {
    
    static var preview: DIContainer {
        let navigationService = NavigationService()
        let storage = StorageStub()
        let moviesService = MoviesServiceStub()

        return DIContainer(
            navigationService: navigationService,
            moviesService: moviesService,
            storage: storage
        )
    }
}
