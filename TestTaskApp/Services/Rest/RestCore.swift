//
//  RestCore.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

final class RestCore {
    
    /// Function for request to API.
    ///
    /// This function supports only **GET** requests.
    /// - Parameters:
    ///   - path: entire request path
    ///   - parameters: query parameters
    ///   - type: type of result model
    /// - Returns: result of response
    func getResponse<T>(
        path: String,
        parameters: [String: String],
        type: T.Type
    ) async -> ResponseResult<T> where T: Decodable {
        guard var urlComponents: URLComponents = URLComponents(
            string: path
        ) else {
            return .failure(.undefined)
        }
        urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        guard let url = urlComponents.url else {
            return .failure(.undefined)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                // Unfortunately, IMDB API returns status code 200 when there is key error or other errors.
                let response = try JSONDecoder().decode(type, from: data)
                return .success(response)
            } catch {
                return .failure(.failedParsing(error))
            }
        } catch {
            return .failure(.failedParsing(error))
        }
    }
}
