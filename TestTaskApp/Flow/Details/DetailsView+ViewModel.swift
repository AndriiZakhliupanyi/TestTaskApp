//
//  DetailsView+ViewModel.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

extension DetailsView {
    
    final class DetailsViewModel: ViewModel {
        
        private let router: DetailsRouter
        private let diContainer: DIContainer
        
        init(router: DetailsRouter, diContainer: DIContainer) {
            self.diContainer = diContainer
            self.router = router
        }
    }
}
