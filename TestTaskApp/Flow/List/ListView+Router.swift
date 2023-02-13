//
//  ListView+Router.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

protocol ListRouter: AnyObject {
    
    func openDetails(movie: Movie)
}

extension ListView {
    
    final class ListRouterImpl: ListRouter {
        
        private let diContainer: DIContainer
        
        init(diContainer: DIContainer) {
            self.diContainer = diContainer
        }
        
        func openDetails(movie: Movie) {
            let router = DetailsView.DetailsRouterImpl(diContainer: diContainer)
            let viewModel = DetailsView.DetailsViewModel(movie: movie, router: router, diContainer: diContainer)
            let view = DetailsView(viewModel: viewModel)
            diContainer.navigationService.push(view)
        }
    }
}
