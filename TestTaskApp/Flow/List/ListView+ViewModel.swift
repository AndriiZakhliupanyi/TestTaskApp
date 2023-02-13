//
//  ListView+ViewModel.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI
import Combine

extension ListView {
    
    enum State {
        
        case loading
        case movies([Movie])
        case error
    }
    
    final class ListViewModel: ViewModel {
        
        @Published var state: State = .movies([])
        @Published var searchText: String = ""
        
        private let router: ListRouter
        private let diContainer: DIContainer
        private var lastTask: Task<(), Never>?
        private var subscriptions = Set<AnyCancellable>()
        
        init(router: ListRouter, diContainer: DIContainer) {
            self.diContainer = diContainer
            self.router = router
            reload()
            setupBinding()
        }
        
        private func setupBinding() {
            $searchText
                .debounce(for: 0.5, scheduler: RunLoop.main)
                .eraseToAnyPublisher()
                .sink { [weak self] _ in
                    self?.reload()
                }
                .store(in: &subscriptions)
        }
        
        func reload() {
            lastTask?.cancel()
            lastTask = Task { @MainActor [weak self] in
                self?.state = .loading
                let moviesResult: MoviesResult?
                print("Start")
                if searchText.isEmpty {
                    moviesResult = await self?.diContainer.moviesService.movies
                } else {
                    moviesResult = await self?.diContainer.moviesService.getMovies(query: searchText)
                }
                print("End")
                
                guard let moviesResult = moviesResult else {
                    self?.state = .error
                    return
                }
                switch moviesResult {
                case .success(let movies):
                    self?.state = .movies(movies)
                case .failure:
                    self?.state = .error
                }
            }
        }
        
        func handle(movie: Movie) {
            router.openDetails(movie: movie)
        }
    }
}
