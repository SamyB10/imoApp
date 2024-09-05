//
//  SliderViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 05/09/2024.
//

import SwiftUI
final class SliderViewModel: ObservableObject {
    let title: String
    let appearance: Appearance
    @Published var priceMin: Double
    @Published var priceMax: Double
    @Published var localisation: Double
    let maxRange: Double?

    init(appearance: Appearance,
         title: String,
         priceMin: Double,
         priceMax: Double,
         localisation: Double,
         maxRange: Double? = nil) {
        self.appearance = appearance
        self.title = title
        self.priceMin = priceMin
        self.priceMax = priceMax
        self.localisation = localisation
        self.maxRange = maxRange
    }
}

extension SliderViewModel {
    enum Appearance: Equatable {
        case minPrice
        case maxPrice(maxRange: Double)
        case localisation
    }

    var range: ClosedRange<Double> {
        switch appearance {
        case .minPrice:
            0...priceMax
        case .maxPrice(let maxRange):
            priceMin...(maxRange)
        case .localisation:
            0...100
        }
    }

    var priceOnChange: Double {
        switch appearance {
        case .minPrice:
            priceMin
        case .maxPrice:
            priceMax
        case .localisation:
            0
        }
    }
}

extension SliderViewModel {
    var step: Double {
        5000
    }

    var fontSize: Font {
        .system(size: 11)
    }

    var paddingText: CGFloat {
        5
    }

    var cornerRadiusText: CGFloat {
        10
    }

    var lineWidth: CGFloat {
        0.5
    }

}
