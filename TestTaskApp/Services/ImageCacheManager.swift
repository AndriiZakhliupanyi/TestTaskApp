//
//  ImageCacheManager.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 14.02.2023.
//

import SwiftUI

/// Cache image in one session
///
/// Implementation of the basic image caching functionality within the session.
final class ImageCacheManager: ObservableObject {
    
    private var images: [URL: Image] = [:]
    
    func getImage(by url: URL) -> Image? {
        return images[url]
    }
    
    func update(image: Image, for url: URL) {
        if images.index(forKey: url) == nil {
            images[url] = image
        }
    }
}
