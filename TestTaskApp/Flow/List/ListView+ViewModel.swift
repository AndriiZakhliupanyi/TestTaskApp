//
//  ListView+ViewModel.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

extension ListView {
    
    final class ListViewModel: ViewModel {
        
        @Published var movies: [Movie] = []
        
        private let router: ListRouter
        private let diContainer: DIContainer
        
        init(router: ListRouter, diContainer: DIContainer) {
            self.diContainer = diContainer
            self.router = router
            reload()
        }
        
        func reload() {
            Task { @MainActor [weak self] in
                guard let moviesResult = await self?.diContainer.moviesService.movies else {
                    return
                }
                switch moviesResult {
                case .success(let movies): self?.movies = movies
                case .failure(let error): print("\(error)")
                }
            }
        }
        
        func handle(movie: Movie) {
            router.openDetails(movie: movie)
        }
    }
}
