//
//  DetailsView+Builder.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

extension DetailsView {
    
    static func assembly(movie: Movie, diContainer: DIContainer) -> some View {
        let router = DetailsView.DetailsRouterImpl(diContainer: diContainer)
        let viewModel = DetailsView.DetailsViewModel(movie: movie, router: router, diContainer: diContainer)
        return DetailsView(viewModel: viewModel)
    }
}
