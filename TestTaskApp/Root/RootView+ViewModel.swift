//
//  RootView+ViewModel.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

extension RootView {
    
    final class RootViewModel: ViewModel {
        
        private let diContainer: DIContainer
        
        init(diContainer: DIContainer) {
            self.diContainer = diContainer
        }
        
        func navigationUICoordinator() -> NavigationUICoordinator {
            return NavigationUICoordinator(diContainer: diContainer)
        }
        
        func listViewModel() -> ListView.ListViewModel {
            return ListView.ListViewModel(
                router: ListView.ListRouterImpl(diContainer: diContainer),
                diContainer: diContainer
            )
        }
    }
}
