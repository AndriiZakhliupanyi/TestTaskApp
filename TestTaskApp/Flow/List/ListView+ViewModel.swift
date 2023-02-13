//
//  ListView+ViewModel.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

extension ListView {
    
    final class ListViewModel: ViewModel {
        
        private let router: ListRouter
        private let diContainer: DIContainer
        
        init(router: ListRouter, diContainer: DIContainer) {
            self.diContainer = diContainer
            self.router = router
        }
    }
}
