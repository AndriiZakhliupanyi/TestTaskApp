//
//  RestMoviesServiceStub.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

final class RestMoviesServiceStub: RestMoviesService {
    
    var movies: ResponseResult<ResponseMovies> {
        get async {
            return .success(
                .init(
                    items: [
                        .placeholder(id: 1),
                        .placeholder(id: 2),
                        .placeholder(id: 3),
                        .placeholder(id: 4),
                        .placeholder(id: 5)
                    ],
                    errorMessage: ""
                )
            )
        }
    }
}
