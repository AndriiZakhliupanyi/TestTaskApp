//
//  RootView.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var viewModel: RootViewModel
    
    var body: some View {
        NavigationUIController(
            rootView: ListView(viewModel: viewModel.listViewModel()),
            coordinator: viewModel.navigationUICoordinator()
        )
//        .background(
//            Asset.Colors.primary.color
//                .ignoresSafeArea()
//        )
    }
}

struct RootView_Previews: PreviewProvider {
    
    static var previews: some View {
        RootView(viewModel: .init(diContainer: .preview))
    }
}
