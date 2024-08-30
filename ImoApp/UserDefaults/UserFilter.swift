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
        case localisation
        case selectedPropertyType
        case studio
        case oneRoom
        case twoRoom
        case threeRoom
        case fourRoom
        case fiveOrMoreRoom
    }

    enum PropertyType: String {
        case house
        case both
        case appartment
    }

    enum Filter {
        case propertyType(PropertyType)
        case roomCount(Keys, Bool)
    }

    func saveValue(filter: Filter) {
        switch filter {
        case .propertyType(let type):
            userDefaults.set(type.rawValue, forKey: Keys.selectedPropertyType.rawValue)
        case .roomCount(let key, let value):
            userDefaults.set(value, forKey: key.rawValue)
            print(value)
        }
    }

    func getProperty() -> FilterContent.TypeProperty {
        guard let property = userDefaults.string(forKey: Keys.selectedPropertyType.rawValue),
              let propertyType = PropertyType(rawValue: property) else { return .both }

        switch propertyType {
        case .house:
            return .house
        case .both:
            return .both
        case .appartment:
            return .appartment
        }
    }

//    func getStudio() -> Bool {
//        let studio = userDefaults.object(forKey: Keys.studio.rawValue) as? Bool ?? false
//        return studio
//    }

//    func getNumberOfRoom() -> FilterContent.NumberOfRoom {
//        let studio = userDefaults.object(forKey: Keys.studio.rawValue) as? Bool ?? false
//        let oneRoom = userDefaults.object(forKey: Keys.oneRoom.rawValue) as? Bool ?? false
//        let twoRoom = userDefaults.object(forKey: Keys.twoRoom.rawValue) as? Bool ?? false
//        let threeRoom = userDefaults.object(forKey: Keys.threeRoom.rawValue) as? Bool ?? false
//        let fourRoom = userDefaults.object(forKey: Keys.fourRoom.rawValue) as? Bool ?? false
//        let fiveOrMoreRoom = userDefaults.object(forKey: Keys.fiveOrMoreRoom.rawValue) as? Bool ?? false
//
//        return FilterContent.NumberOfRoom(one: oneRoom,
//                                          two: twoRoom,
//                                          three: threeRoom,
//                                          four: fourRoom,
//                                          fiveOrMore: fiveOrMoreRoom)
//    }

    var studio: Bool {
        userDefaults.object(forKey: Keys.studio.rawValue) as? Bool ?? false
    }

    var oneRoom: Bool {
        userDefaults.object(forKey: Keys.oneRoom.rawValue) as? Bool ?? false
    }
    
    var twoRoom: Bool {
        userDefaults.object(forKey: Keys.twoRoom.rawValue) as? Bool ?? false
    }
    
    var threeRoom: Bool {
        userDefaults.object(forKey: Keys.threeRoom.rawValue) as? Bool ?? false
    }
    
    var fourRoom: Bool {
        userDefaults.object(forKey: Keys.fourRoom.rawValue) as? Bool ?? false
    }

    var fiveOrMoreRoom: Bool {
        userDefaults.object(forKey: Keys.fiveOrMoreRoom.rawValue) as? Bool ?? false
    }
}
