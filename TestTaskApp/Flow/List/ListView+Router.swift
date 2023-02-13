//
//  ListView+Router.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

protocol ListRouter: AnyObject {
    
//    func openModule()
}

extension ListView {
    
    final class ListRouterImpl: ListRouter {
        
        private let diContainer: DIContainer
        
        init(diContainer: DIContainer) {
            self.diContainer = diContainer
        }
        
//        func openModule() {
//            let router = ModuleView.ModuleRouterImpl(diContainer: diContainer)
//            let viewModel = ModuleView.ModuleViewModel(router: router, diContainer: diContainer)
//            let view = ModuleView(viewModel: viewModel)
//            diContainer.services.navigationService.push(view)
//        }
    }
}
