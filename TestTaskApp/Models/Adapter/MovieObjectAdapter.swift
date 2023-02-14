//
//  MovieObjectAdapter.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

struct MovieObjectAdapter {
    
    private let model: Movie
    private let object: MovieObject
    
    init(model: Movie, object: MovieObject) {
        self.model = model
        self.object = object
    }
    
    func toMovieObject() {
        object.id = model.id
        object.rank = Int32(model.rank) ?? 0
        object.title = model.title
        object.fullTitle = model.fullTitle
        object.year = model.year
        object.image = model.image
        object.crew = model.crew
        object.imDbRating = model.imDbRating
        object.imDbRatingCount = model.imDbRatingCount
    }
}
