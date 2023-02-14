//
//  Results.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

typealias MoviesResult = ResponseResult<[Movie]>
typealias ResponseResult<T> = Result<T, ResponseError>
