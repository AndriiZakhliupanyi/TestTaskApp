//
//  RestMoviesService.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

protocol RestMoviesService {
    
    var movies: ResponseResult<ResponseMovies> { get async }
}

final class RestMoviesServiceImpl: RestMoviesService {
    
    private let core: RestCore = RestCore()
    
    var movies: ResponseResult<ResponseMovies> {
        get async {
            guard let host = ConfigConstants.host,
                  let imdbKey = ConfigConstants.imdbKey else {
                return .failure(.undefined)
            }
            let path = "https://\(host)/API/Top250Movies/\(imdbKey)"
            
            return await core.getResponse(
                path: path,
                parameters: [:],
                type: ResponseMovies.self
            )
        }
    }
}
