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
    
    static func placeholder(id: Int) -> Movie {
        return Movie(
            id: "\(id)",
            rank: "\(id)",
            title: "Movie - \(id)",
            fullTitle: "The movie",
            year: "2023",
            image: "https://imdb-api.com/images/original/nopicture.jpg",
            crew: "First, Second.",
            imDbRating: "10",
            imDbRatingCount: "100"
        )
    }
    
    static var placeholder: Movie {
        return placeholder(id: 1)
    }
}
