//
//  CardViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/08/2024.
//

import Foundation

enum TypeCardHome: Equatable, Hashable {
    case carousel(titleSection: String, [CardHomeViewModel])
    case stacked(titleSection: String, [CardHomeViewModel])
    case `default`(titleSection: String, [CardHomeViewModel])

}

struct CardHomeViewModel: Hashable, Identifiable {
    let id: UUID = .init()
    let imageHouse: String
    let titleHouse: String
    let addressHouse: String
    let numberRoom: Int
    let price: Double
    let houseSurfaceArea: Int
}

extension [CardHomeViewModel] {
    var hMargin: CGFloat {
#if os(macOS)
        40.0
#else
        20.0
#endif
    }
    
    var hSpacing: CGFloat {
        10.0
    }

    var horizontalMarginScrollViewCarousel: CGFloat {
#if os(macOS)
        40.0
#else
        20.0
#endif
    }
}

extension CardHomeViewModel {
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

extension CardHomeViewModel {
    static var viewModelTest = CardHomeViewModel(imageHouse: "coucher_soleil",
                                                 titleHouse: "Title House",
                                                 addressHouse: "Address House",
                                                 numberRoom: 4,
                                                 price: 250.000,
                                                 houseSurfaceArea: 100)

    static var viewModelSample: [CardHomeViewModel] {
        var cardHome: [CardHomeViewModel] = []
        for _ in 1...10 {
            let random = Int.random(in: 1...4)
            let card = CardHomeViewModel(imageHouse: "\(random)",
                                         titleHouse: "Title House",
                                         addressHouse: "Address House",
                                         numberRoom: 4,
                                         price: 250.000,
                                         houseSurfaceArea: 100)

            cardHome.append(card)
        }
        return cardHome
    }
}

extension [CardHomeViewModel] {
    func zIndex(_ item: CardHomeViewModel) -> CGFloat {
        if let index = firstIndex(where: { $0.id == item.id }) {
            return CGFloat(count) - CGFloat(index)
        }

        return .zero
    }
}
