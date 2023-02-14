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
                .dropFirst()
                .debounce(for: 0.5, scheduler: RunLoop.main)
                .eraseToAnyPublisher()
                .sink { [weak self] _ in
                    self?.reload()
                }
                .store(in: &subscriptions)
        }
        
        func reload() {
            lastTask?.cancel()
            lastTask = Task { [weak self] in
                consoleLog("Start")
                await self?.fetchMovies()
            }
        }
        
        @MainActor
        func fetchMovies() async {
            state = .loading
            let moviesResult: MoviesResult?
            
            if searchText.isEmpty {
                moviesResult = await diContainer.moviesService.movies
            } else {
                moviesResult = await diContainer.moviesService.getMovies(query: searchText)
            }
            
            guard !Task.isCancelled else {
                return
            }
            
            consoleLog("End")
            guard let moviesResult = moviesResult else {
                state = .error
                return
            }
            switch moviesResult {
            case .success(let movies):
                state = .movies(movies)
            case .failure:
                state = .error
            }
        }
        
        func handle(movie: Movie) {
            router.openDetails(movie: movie)
        }
    }
}
