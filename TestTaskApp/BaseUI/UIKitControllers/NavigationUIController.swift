//
//  NavigationUIController.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import UIKit
import SwiftUI

struct NavigationUIController<T: View>: UIViewControllerRepresentable {
    
    var rootView: T
    let coordinator: NavigationUICoordinator
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let hostingController = HostingController(rootView: rootView)
        let navigationController = UINavigationController(rootViewController: hostingController)
        navigationController.navigationBar.prefersLargeTitles = false
        context.coordinator.set(navigationController)
        
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
    
    func makeCoordinator() -> NavigationUICoordinator {
        return coordinator
    }
}

final class NavigationUICoordinator: NSObject {
    
    private let diContainer: DIContainer
    
    init(diContainer: DIContainer) {
        self.diContainer = diContainer
    }
    
    fileprivate func set(_ navigationController: UINavigationController) {
        diContainer.navigationService.set(navigationController: navigationController)
    }
}
