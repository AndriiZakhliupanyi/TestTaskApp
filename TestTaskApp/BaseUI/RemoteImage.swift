//
//  RemoteImage.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 14.02.2023.
//

import SwiftUI

/// Async fetch image with cache within the session.
struct RemoteImage: View {
    
    @EnvironmentObject var imageCache: ImageCacheManager
    
    let url: URL?
    
    var body: some View {
        if let url = url {
            if let image = imageCache.getImage(by: url) {
                imageView(url: url, image: image)
            } else {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        imageView(url: url, image: image)
                    } else if phase.error != nil {
                        placeholder
                    } else {
                        ProgressView()
                    }
                }
            }
        } else {
            placeholder
        }
    }
    
    var placeholder: some View {
        Asset.Images.placeholder.image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    func imageView(url: URL, image: Image) -> some View {
        imageCache.update(image: image, for: url)
        
        return image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
