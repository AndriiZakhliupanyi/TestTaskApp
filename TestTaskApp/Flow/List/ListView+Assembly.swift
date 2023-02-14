//
//  ListView+Builder.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

extension ListView {
    
    static func assembly(diContainer: DIContainer) -> some View {
        let router = ListView.ListRouterImpl(diContainer: diContainer)
        let viewModel = ListView.ListViewModel(router: router, diContainer: diContainer)
        return ListView(viewModel: viewModel)
    }
}
