//
//  SliderViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 05/09/2024.
//

import SwiftUI
final class SliderViewModel: ObservableObject {
    let title: String
    var appearance: Appearance

    @Published var localisation: Double = 0.0
    @Published var priceMin: Int = 0
    @Published var priceMax: Int = 0
    @Published var minAreaSquare: Int = 0
    @Published var maxAreaSquare: Int = 0

    init(appearance: Appearance,
         title: String,
         maxRange: Double? = nil) {
        self.appearance = appearance
        self.title = title
        
        switch appearance {
        case let .localisation(value):
            localisation = value
        case let .price(min, max):
            priceMin = min
            priceMax = max
        case let .areaSquareMeter(min, max):
            minAreaSquare = min
            maxAreaSquare = max
        }
    }
}

extension SliderViewModel {
    enum Appearance: Equatable {
        case price(Int, Int)
        case areaSquareMeter(Int, Int)
        case localisation(Double)
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

    var rangeMinPrice: Int {
        0
    }

    var rangeMaxPrice: Int {
        switch appearance {
        case .price:
            1000000
        case .areaSquareMeter:
            400
        case .localisation:
            100
        }
    }
    
    var spaceBetween: CGFloat {
        0.05
    }

    var heightSlider: CGFloat {
        5
    }

    var stepValue: Int {
        switch appearance {
        case .price:
            20000
        case .areaSquareMeter:
            5
        case .localisation:
            10
        }
    }

    var paddingHorizontalRectangle: CGFloat {
        40
    }

    var valueMax: Int {
        switch appearance {
        case .price:
            priceMax
        case .localisation:
            0
        case .areaSquareMeter:
            maxAreaSquare
        }
    }

    var valueMin: Int {
        switch appearance {
        case .price:
            priceMin
        case .localisation:
            0
        case .areaSquareMeter:
            minAreaSquare
        }
    }
}
