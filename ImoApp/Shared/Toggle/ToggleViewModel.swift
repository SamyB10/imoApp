//
//  ToggleViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 28/08/2024.
//

import Foundation
import SwiftUI
final class ToggleViewModel: ObservableObject {
    let apperance: Apperance
    let title: String?
    @Published var isOn: Bool

    init(apperance: Apperance,
         title: String? = nil,
         isOn: Bool) {
        self.apperance = apperance
        self.title = title
        self.isOn = isOn
    }

    enum Apperance {
        case `switch`
        case button
    }
}

extension ToggleViewModel: Hashable {
    public static func == (lhs: ToggleViewModel, rhs: ToggleViewModel) -> Bool {
        return lhs.title == rhs.title
        && lhs.isOn == rhs.isOn
        && lhs.apperance == rhs.apperance
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(isOn)
        hasher.combine(apperance)
    }
}


//
//
final class SliderViewModel: ObservableObject {
    let title: String
    @Published var priceMin: Double {
        didSet {
            if priceMin == priceMax {
                priceMax = priceMin
            }
        }
    }
    @Published var priceMax: Double {
        didSet {
            if priceMax < priceMin {
                priceMin = priceMax
            }
        }
    }

    init(title: String,
         priceMin: Double,
         priceMax: Double) {
        self.title = title
        self.priceMin = priceMin
        self.priceMax = priceMax
    }
}
