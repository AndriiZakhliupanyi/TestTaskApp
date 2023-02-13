//
//  ConfigConstants.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

enum ConfigConstants {
    
    private static func getValue(by key: String) -> String? {
        guard let info = Bundle.main.infoDictionary?[key] as? String else {
            return nil
        }
        
        return info
    }
    
    static var host: String? {
        return ConfigConstants.getValue(by: "Host")
    }
    
    static var imdbKey: String? {
        return ConfigConstants.getValue(by: "Imdb key")
    }
}
