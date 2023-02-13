//
//  TestTaskAppApp.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

@main
struct TestTaskAppApp: App {
    
    private let diContainer: DIContainer
    
    init() {
        let navigationService = NavigationService()
        let storage = StorageImpl()
        let moviesService = MoviesServiceImpl(
            restService: RestMoviesServiceImpl(),
            coreDataService: CoreDataMoviesServiceImpl(coreManager: .init(modelName: "DataModel")),
            storage: storage
        )
        
        diContainer = DIContainer(
            navigationService: navigationService,
            moviesService: moviesService,
            storage: storage
        )
        
        setupNavigation()
        setupURLCache()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: RootView.RootViewModel(diContainer: diContainer))
        }
    }
    
    func setupNavigation() {
        UINavigationBar.appearance().tintColor = Asset.Colors.info.uiColor
    }
    
    func setupURLCache() {
        URLCache.shared.memoryCapacity = 100_000_000 // ~100 MB memory space
        URLCache.shared.diskCapacity = 500_000_000 // ~500 MB disk cache space
    }
}
