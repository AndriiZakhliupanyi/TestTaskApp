//
//  ResponseResult.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

enum ResponseError: Error {
    
    case undefined
    case failedParsing(Error)
    case failedFetching(Error)
}
