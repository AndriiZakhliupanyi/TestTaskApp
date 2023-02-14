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
            let view = DetailsView.assembly(movie: movie, diContainer: diContainer)
            diContainer.navigationService.push(view)
        }
    }
}
