//
//  RestMoviesServiceSpy.swift
//  TestTaskAppTests
//
//  Created by Andrii Zakhliupanyi on 14.02.2023.
//

@testable import TestTaskApp
import Foundation

final class RestMoviesServiceSpy: RestMoviesService {
    
    var moviesCountCalled: Int = 0
    var movies: ResponseResult<ResponseMovies> {
        get async {
            moviesCountCalled += 1
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
