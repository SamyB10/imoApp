//
//  Untitled.swift
//  ImoApp
//
//  Created by Boussair Samy on 24/09/2024.
//

import Foundation
@propertyWrapper
struct StoredData<Value> {
    let key: String
    let defaultValue: Value

    var wrappedValue: Value {
        get {
            return UserDefaults.standard.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
