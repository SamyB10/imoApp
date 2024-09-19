//
//  CardViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/08/2024.
//

import Foundation

extension HomeViewModel.ViewModel {
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
                                                                         houseSurfaceArea: 100)

    static var viewModelSample: [HomeViewModel.ViewModel.CardHomeViewModel] {
        var cardHome: [HomeViewModel.ViewModel.CardHomeViewModel] = []
        for _ in 1...10 {
            let random = Int.random(in: 1...4)
            let card = HomeViewModel.ViewModel.CardHomeViewModel(imageHouse: "\(random)",
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

extension [HomeViewModel.ViewModel.CardHomeViewModel] {
    func zIndex(_ item: HomeViewModel.ViewModel.CardHomeViewModel) -> CGFloat {
        if let index = firstIndex(where: { $0.id == item.id }) {
            return CGFloat(count) - CGFloat(index)
        }

        return .zero
    }
}
