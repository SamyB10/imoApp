//
//  CardViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/08/2024.
//

import Foundation

enum ItemDetailHouse: CaseIterable {
    case surface
    case price
    case numberOfRoom
}

struct CarouselViewModel: Hashable {
    let imageHouse: String
    let titleHouse: String
    let addressHouse: String
    let numberRoom: Int
    let price: Double
    let houseSurfaceArea: Int
}

extension CarouselViewModel {
    var stackPadding: CGFloat {
        20.0
    }

    var ratio: CGFloat {
        4.0 / 3.0
    }

    var regularCount: Int {
        2
    }

    var hSpacing: CGFloat {
        10.0
    }

    var cornerRadius: CGFloat {
        10.0
    }
}

extension CarouselViewModel {
    static var viewModelTest = CarouselViewModel(imageHouse: "coucher_soleil",
                                                 titleHouse: "Title House",
                                                 addressHouse: "Address House",
                                                 numberRoom: 4,
                                                 price: 250.000,
                                                 houseSurfaceArea: 100)
}
