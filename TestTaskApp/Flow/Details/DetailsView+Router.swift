//
//  DetailsView+Router.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

protocol DetailsRouter: AnyObject {
    
    func dismiss()
}

extension DetailsView {
    
    final class DetailsRouterImpl: DetailsRouter {
        
        private let diContainer: DIContainer
        
        init(diContainer: DIContainer) {
            self.diContainer = diContainer
        }
        
        func dismiss() {
            diContainer.navigationService.pop()
        }
    }
}
