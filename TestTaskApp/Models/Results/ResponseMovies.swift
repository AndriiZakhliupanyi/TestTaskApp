//
//  ResponseMovies.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

struct ResponseMovies: Decodable {
    
    let items: [Movie]
    let errorMessage: String
}
