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
        
        var navigationUICoordinator: NavigationUICoordinator {
            return NavigationUICoordinator(diContainer: diContainer)
        }
        
        var rootView: some View {
            return ListView.assembly(diContainer: diContainer)
        }
        
        init(diContainer: DIContainer) {
            self.diContainer = diContainer
        }
    }
}
