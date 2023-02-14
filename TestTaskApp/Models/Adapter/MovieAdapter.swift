//
//  MovieAdapter.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

struct MovieAdapter {
    
    private let object: MovieObject
    
    init(object: MovieObject) {
        self.object = object
    }
    
    var model: Movie {
        return Movie(
            id: object.id,
            rank: String(object.rank),
            title: object.title,
            fullTitle: object.fullTitle,
            year: object.year,
            image: object.image,
            crew: object.crew,
            imDbRating: object.imDbRating,
            imDbRatingCount: object.imDbRatingCount
        )
    }
}
