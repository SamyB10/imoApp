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
        case localisationDistance
        case selectedPropertyType
        case studio
        case oneRoom
        case twoRoom
        case threeRoom
        case fourRoom
        case fiveOrMoreRoom
        case oneBedroom
        case twoBedroom
        case threeBedroom
        case fourBedroom
        case fiveOrMoreBedroom
        case buildBefore1950
        case buildBetwen1950And2000
        case buildAfter2000
        case energyA
        case energyB
        case energyC
        case energyD
        case energyE
        case energyF
        case energyG
    }

    enum PropertyType: String {
        case house
        case both
        case appartment
    }

    enum Filter {
        case propertyType(PropertyType)
        case localisationDistance(Keys, Double)
        case roomCount(Keys, Bool)
        case bedroomCount(Keys, Bool)
        case buildYear(Keys, Bool)
        case energyPerformance(Keys, Bool)
    }

    func saveLocation(with: String) {
        userDefaults.set("Rosny", forKey: Keys.localisation.rawValue)
    }

    func saveValue(filter: Filter) {
        switch filter {
        case let .propertyType(type):
            userDefaults.set(type.rawValue, forKey: Keys.selectedPropertyType.rawValue)
        case let .roomCount(key, value):
            userDefaults.set(value, forKey: key.rawValue)
        case let .bedroomCount(key, value):
            userDefaults.set(value, forKey: key.rawValue)
        case let .buildYear(key, value):
            userDefaults.set(value, forKey: key.rawValue)
        case let .energyPerformance(key, value):
            userDefaults.set(value, forKey: key.rawValue)
        case let .localisationDistance(key, value):
            userDefaults.set(value, forKey: key.rawValue)
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

    var location: String {
        userDefaults.object(forKey: Keys.localisation.rawValue) as? String ?? "NIL"
    }

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

    var oneBedRoom: Bool {
        userDefaults.object(forKey: Keys.oneBedroom.rawValue) as? Bool ?? false
    }

    var twoBedRoom: Bool {
        userDefaults.object(forKey: Keys.twoBedroom.rawValue) as? Bool ?? false
    }

    var threeBedRoom: Bool {
        userDefaults.object(forKey: Keys.threeBedroom.rawValue) as? Bool ?? false
    }

    var fourBedRoom: Bool {
        userDefaults.object(forKey: Keys.fourBedroom.rawValue) as? Bool ?? false
    }

    var fiveOrMoreBedRoom: Bool {
        userDefaults.object(forKey: Keys.fiveOrMoreBedroom.rawValue) as? Bool ?? false
    }

    var buildBefore1950: Bool {
        userDefaults.object(forKey: Keys.buildBefore1950.rawValue) as? Bool ?? false
    }

    var buildBetwen1950And2000: Bool {
        userDefaults.object(forKey: Keys.buildBetwen1950And2000.rawValue) as? Bool ?? false
    }

    var buildAfter2000: Bool {
        userDefaults.object(forKey: Keys.buildAfter2000.rawValue) as? Bool ?? false
    }

    var energyA: Bool {
        userDefaults.object(forKey: Keys.energyA.rawValue) as? Bool ?? false
    }

    var energyB: Bool {
        userDefaults.object(forKey: Keys.energyB.rawValue) as? Bool ?? false
    }

    var energyC: Bool {
        userDefaults.object(forKey: Keys.energyC.rawValue) as? Bool ?? false
    }

    var energyD: Bool {
        userDefaults.object(forKey: Keys.energyD.rawValue) as? Bool ?? false
    }

    var energyE: Bool {
        userDefaults.object(forKey: Keys.energyE.rawValue) as? Bool ?? false
    }

    var energyF: Bool {
        userDefaults.object(forKey: Keys.energyF.rawValue) as? Bool ?? false
    }

    var energyG: Bool {
        userDefaults.object(forKey: Keys.energyG.rawValue) as? Bool ?? false
    }

    var localisationDistance: Double {
        userDefaults.object(forKey: Keys.localisationDistance.rawValue) as? Double ?? 10.0
    }
}
