//
//  StorageCore.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

protocol Storable {
    
    @discardableResult
    func set<T: Encodable>(value: T, for key: String) -> Bool
    func get<T>(for key: String) -> T? where T: Decodable
}

final class UserDefaultsStorage: Storable {
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    @discardableResult
    func set<T: Encodable>(value: T, for key: String) -> Bool {
        let encoder = JSONEncoder()
        guard let data: Data = try? encoder.encode(value) else {
            return false
        }
        
        userDefaults.set(data, forKey: key)
        userDefaults.synchronize()
        
        return true
    }
    
    func get<T>(for key: String) -> T? where T: Decodable {
        guard let data = userDefaults.object(forKey: key) as? Data else {
            return nil
        }
        let decoder = JSONDecoder()
        userDefaults.synchronize()
        
        return try? decoder.decode(T.self, from: data)
    }
}
