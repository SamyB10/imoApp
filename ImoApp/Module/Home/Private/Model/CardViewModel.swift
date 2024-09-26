//
//  CardViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/08/2024.
//

import Foundation
import SwiftData

extension HomeViewModel.ViewModel {
    enum TypeCardHome: Equatable, Hashable {
        case carousel(titleSection: String, [CardHomeViewModel])
        case stacked(titleSection: String, [CardHomeViewModel])
        case `default`(titleSection: String, [CardHomeViewModel])
    }

    @Model
    final class CardHomeViewModel: Hashable, Identifiable {
        private(set) var id: String
        private(set) var imageHouse: String
        private(set) var titleHouse: String
        private(set) var addressHouse: String
        private(set) var numberRoom: Int
        private(set) var price: Double
        private(set) var houseSurfaceArea: Int
        var isFavorite: Bool

        init(imageHouse: String,
             titleHouse: String,
             addressHouse: String,
             numberRoom: Int,
             price: Double,
             houseSurfaceArea: Int,
             isFavorite: Bool) {
            self.id = UUID().uuidString
            self.imageHouse = imageHouse
            self.titleHouse = titleHouse
            self.addressHouse = addressHouse
            self.numberRoom = numberRoom
            self.price = price
            self.houseSurfaceArea = houseSurfaceArea
            self.isFavorite = isFavorite
        }

        static func == (lhs: CardHomeViewModel, rhs: CardHomeViewModel) -> Bool {
            return lhs.id == rhs.id
            && lhs.imageHouse == rhs.imageHouse
            && lhs.titleHouse == rhs.titleHouse
            && lhs.addressHouse == rhs.addressHouse
            && lhs.numberRoom == rhs.numberRoom
            && lhs.price == rhs.price
            && lhs.houseSurfaceArea == rhs.houseSurfaceArea
            && lhs.isFavorite == rhs.isFavorite
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(imageHouse)
            hasher.combine(titleHouse)
            hasher.combine(addressHouse)
            hasher.combine(numberRoom)
            hasher.combine(price)
            hasher.combine(houseSurfaceArea)
            hasher.combine(isFavorite)
        }
    }
}

extension [HomeViewModel.ViewModel.CardHomeViewModel] {
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

extension HomeViewModel.ViewModel.CardHomeViewModel {
    var stackPadding: CGFloat {
        20.0
    }

    var ratio: CGFloat {
        4.0 / 3.0
    }

    var regularCount: Int {
        2
    }

    var horizontalSpacing: CGFloat {
        10.0
    }

    var cornerRadius: CGFloat {
        10.0
    }

}

extension HomeViewModel.ViewModel.CardHomeViewModel {
    static var viewModelTest = HomeViewModel.ViewModel.CardHomeViewModel(imageHouse: "coucher_soleil",
                                                                         titleHouse: "Title House",
                                                                         addressHouse: "Address House",
                                                                         numberRoom: 4,
                                                                         price: 250.000,
                                                                         houseSurfaceArea: 100,
                                                                         isFavorite: false)

    static var viewModelSample: [HomeViewModel.ViewModel.CardHomeViewModel] {
        var cardHome: [HomeViewModel.ViewModel.CardHomeViewModel] = []
        for _ in 1...10 {
            let random = Int.random(in: 1...4)
            let card = HomeViewModel.ViewModel.CardHomeViewModel(imageHouse: "\(random)",
                                                                 titleHouse: "Title House",
                                                                 addressHouse: "Address House",
                                                                 numberRoom: 4,
                                                                 price: 250.000,
                                                                 houseSurfaceArea: 100,
                                                                 isFavorite: false)

            cardHome.append(card)
        }
        return cardHome
    }
}

extension [HomeViewModel.ViewModel.CardHomeViewModel] {
    func zIndex(_ item: HomeViewModel.ViewModel.CardHomeViewModel) -> CGFloat {
        if let index = firstIndex(where: { $0.id == item.id }) {
            return CGFloat(count) - CGFloat(index)
        }

        return .zero
    }
}
