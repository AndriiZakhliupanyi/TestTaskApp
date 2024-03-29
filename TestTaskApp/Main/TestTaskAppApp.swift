//
//  TestTaskAppApp.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

@main
struct TestTaskAppApp: App {
    
    @StateObject var imageCache = ImageCacheManager()

    private let diContainer: DIContainer
    
    init() {
        let navigationService = NavigationService()
        let storage = StorageImpl()
        let moviesService = MoviesServiceImpl(
            restService: RestMoviesServiceImpl(),
            coreDataService: CoreDataMoviesServiceImpl(
                coreManager: .init(modelName: "DataModel")
            ),
            storage: storage
        )
        
        diContainer = DIContainer(
            navigationService: navigationService,
            moviesService: moviesService,
            storage: storage
        )
        
        setupNavigation()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: RootView.RootViewModel(diContainer: diContainer))
                .environmentObject(imageCache)
        }
    }
    
    func setupNavigation() {
        UINavigationBar.appearance().tintColor = Asset.Colors.info.uiColor
    }
}
