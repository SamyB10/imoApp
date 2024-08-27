//
//  UserSettings.swift
//  ImoApp
//
//  Created by Boussair Samy on 23/08/2024.
//

import Foundation

class UserFilter {
    let userDefaults = UserDefaults.standard

    enum Keys: String {
        case selectedPropertyType = "selectedPropertyType"
    }

    enum Filter: String, CaseIterable {
        case house = "house"
        case both = "both"
        case appartment = "appartment"
    }

    func saveValue(key: Keys, filter: Filter) {
        switch key {
        case .selectedPropertyType:
            userDefaults.set(filter.rawValue, forKey: key.rawValue)
        }
    }

    func getProperty() -> FilterContent.TypeProperty {
        //        let filter = Filter.allCases
        guard let property = userDefaults.string(forKey: Keys.selectedPropertyType.rawValue) else { return .both }
        
        switch property {
        case "house":
            return .house
        case "both":
            return .both
        case "appartment":
            return .appartment
        default:
            return .both
        }
    }
}
