//
//  NavigationService.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import UIKit
import SwiftUI

final class NavigationService: NSObject {
    
    private weak var navigationController: UINavigationController?
    
    func set(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func push<Content: View>(_ view: Content, animated: Bool = true) {
        navigationController?.pushViewController(
            HostingController(rootView: view),
            animated: animated
        )
    }
    
    func pushAsRoot<Content: View>(_ view: Content, animated: Bool = true) {
        push(view, animated: animated)
        
        if let topController = navigationController?.topViewController {
            navigationController?.viewControllers = [topController]
        }
    }
    
    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
}
