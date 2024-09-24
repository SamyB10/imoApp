//
//  UserSettings.swift
//  ImoApp
//
//  Created by Boussair Samy on 23/08/2024.
//

import Foundation
final class FilterRepository {

    @StoredData(key: Keys.studio.rawValue, defaultValue: false)
    public private(set) var studio: Bool

    @StoredData(key: Keys.twoRoom.rawValue, defaultValue: false)
    public private(set) var twoRoom: Bool

    @StoredData(key: Keys.threeRoom.rawValue, defaultValue: false)
    public private(set) var threeRoom: Bool

    @StoredData(key: Keys.fourRoom.rawValue, defaultValue: false)
    public private(set) var fourRoom: Bool

    @StoredData(key: Keys.fiveOrMoreRoom.rawValue, defaultValue: false)
    public private(set) var fiveOrMoreRoom: Bool

    @StoredData(key: Keys.oneBedroom.rawValue, defaultValue: false)
    public private(set) var oneBedroom: Bool

    @StoredData(key: Keys.twoBedroom.rawValue, defaultValue: false)
    public private(set) var twoBedroom: Bool

    @StoredData(key: Keys.threeBedroom.rawValue, defaultValue: false)
    public private(set) var threeBedroom: Bool

    @StoredData(key: Keys.fourBedroom.rawValue, defaultValue: false)
    public private(set) var fourBedroom: Bool

    @StoredData(key: Keys.fiveOrMoreBedroom.rawValue, defaultValue: false)
    public private(set) var fiveOrMoreBedroom: Bool

    @StoredData(key: Keys.buildBefore1950.rawValue, defaultValue: false)
    public private(set) var buildBefore1950: Bool

    @StoredData(key: Keys.buildBetwen1950And2000.rawValue, defaultValue: false)
    public private(set) var buildBetwen1950And2000: Bool

    @StoredData(key: Keys.buildAfter2000.rawValue, defaultValue: false)
    public private(set) var buildAfter2000: Bool

    @StoredData(key: Keys.eneryPerformanceA.rawValue, defaultValue: false)
    public private(set) var eneryPerformanceA: Bool

    @StoredData(key: Keys.eneryPerformanceB.rawValue, defaultValue: false)
    public private(set) var eneryPerformanceB: Bool

    @StoredData(key: Keys.eneryPerformanceC.rawValue, defaultValue: false)
    public private(set) var eneryPerformanceC: Bool

    @StoredData(key: Keys.eneryPerformanceD.rawValue, defaultValue: false)
    public private(set) var eneryPerformanceD: Bool

    @StoredData(key: Keys.eneryPerformanceE.rawValue, defaultValue: false)
    public private(set) var eneryPerformanceE: Bool

    @StoredData(key: Keys.eneryPerformanceF.rawValue, defaultValue: false)
    public private(set) var eneryPerformanceF: Bool

    @StoredData(key: Keys.eneryPerformanceG.rawValue, defaultValue: false)
    public private(set) var eneryPerformanceG: Bool

    @StoredData(key: Keys.priceMin.rawValue, defaultValue: 0)
    public private(set) var priceMin: Int

    @StoredData(key: Keys.priceMax.rawValue, defaultValue: 1000000)
    public private(set) var priceMax: Int

    @StoredData(key: Keys.areaSquareMin.rawValue, defaultValue: 0)
    public private(set) var areaSquareMin: Int

    @StoredData(key: Keys.areaSquareMax.rawValue, defaultValue: 200)
    public private(set) var areaSquareMax: Int

    @StoredData(key: Keys.localisationDistance.rawValue, defaultValue: 0)
    public private(set) var localisationDistance: Double

    @StoredData(key: Keys.selectedPropertyType.rawValue, defaultValue: PropertyType.both.rawValue)
    public private(set) var selectedPropertyTypeRawValue: String

    public private(set) var selectedPropertyType: PropertyType {
        get { return PropertyType(rawValue: selectedPropertyTypeRawValue) ?? .both }
        set { selectedPropertyTypeRawValue = newValue.rawValue }
    }

    
    func updateStudio(with value: Bool) {
        studio = value
    }

    func updateTwoRoom(with value: Bool) {
        twoRoom = value
    }

    func updateThreeRoom(with value: Bool) {
        threeRoom = value
    }

    func updateFourRoom(with value: Bool) {
        fourRoom = value
    }

    func updateFiveOrMoreRoom(with value: Bool) {
        fiveOrMoreRoom = value
    }

    func updateOneBedRoom(with value: Bool) {
        oneBedroom = value
    }

    func updateTwoBedRoom(with value: Bool) {
        twoBedroom = value
    }

    func updateThreeBedRoom(with value: Bool) {
        threeBedroom = value
    }

    func updateFourBedRoom(with value: Bool) {
        fourBedroom = value
    }

    func updateFiveOrMoreBedRoom(with value: Bool) {
        fiveOrMoreBedroom = value
    }

    func updateBuildYears(with value: BuildYear) {
        switch value {
        case let .buildBefore1950(state):
            buildBefore1950 = state
        case let .buildBetwen1950And2000(state):
            buildBetwen1950And2000 = state
        case let .buildAfter2000(state):
            buildAfter2000 = state
        }
    }

    func updateEneryPerformance(with value: EneryPerformance) {
        switch value {
        case let .eneryPerformanceA(state):
            eneryPerformanceA = state
        case let .eneryPerformanceB(state):
            eneryPerformanceB = state
        case let .eneryPerformanceC(state):
            eneryPerformanceC = state
        case let .eneryPerformanceD(state):
            eneryPerformanceD = state
        case let .eneryPerformanceE(state):
            eneryPerformanceE = state
        case let .eneryPerformanceF(state):
            eneryPerformanceF = state
        case let .eneryPerformanceG(state):
            eneryPerformanceG = state
        }
    }

    func updatePrice(_ min: Int, _ max: Int) {
        priceMin = min
        priceMax = max
    }

    func updateAreaSquare(_ min: Int, _ max: Int) {
        areaSquareMin = min
        areaSquareMax = max
    }

    func updateLocalisationDistance(with distance: Double) {
        localisationDistance = distance
    }

    func updatePropertyType(with value: PropertyType) {
        selectedPropertyType.update(withKey: value.rawValue)
    }
}
