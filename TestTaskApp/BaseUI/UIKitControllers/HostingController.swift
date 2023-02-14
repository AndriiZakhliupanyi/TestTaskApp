//
//  HostingController.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

class HostingController<Content: View>: UIHostingController<Content> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.clipsToBounds = true
    }
}
