//
//  Movie.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

struct Movie: Decodable {
    
    let id: String
    let rank: String
    let title: String
    let fullTitle: String
    let year: String
    let image: String
    let crew: String
    let imDbRating: String
    let imDbRatingCount: String
    
    var imageURL: URL? {
        return URL(string: image)
    }
}

extension Movie {
    
    static var placeholder: Movie {
        return Movie(
            id: "1",
            rank: "1",
            title: "Movie",
            fullTitle: "The movie",
            year: "2023",
            image: "https://imdb-api.com/images/original/nopicture.jpg",
            crew: "",
            imDbRating: "10",
            imDbRatingCount: "100"
        )
    }
}
