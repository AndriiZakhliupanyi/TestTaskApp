//
//  DetailsView+ViewModel.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

extension DetailsView {
    
    final class DetailsViewModel: ViewModel {
        
        @Published var movie: Movie
        
        var titleCount: String {
            return String(movie.title.count)
        }
        
        private let router: DetailsRouter
        private let diContainer: DIContainer
        
        init(movie: Movie, router: DetailsRouter, diContainer: DIContainer) {
            self.movie = movie
            self.diContainer = diContainer
            self.router = router
        }
    }
}
