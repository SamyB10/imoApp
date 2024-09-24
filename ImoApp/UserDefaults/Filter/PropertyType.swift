//
//  PropertyType.swift
//  ImoApp
//
//  Created by Boussair Samy on 24/09/2024.
//

import Foundation
enum PropertyType: String {
    case house
    case both
    case appartment

    public mutating func update(withKey key: String) {
        switch key {
        case PropertyType.house.rawValue:
            self = .house
        case PropertyType.both.rawValue:
            self = .both
        case PropertyType.appartment.rawValue:
            self = .appartment
        default:
            break
        }
    }
}
